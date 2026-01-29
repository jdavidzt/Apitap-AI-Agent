"""
Audio processing utilities using numpy and wave
"""

import wave
import numpy as np
import io
import logging
from typing import Union

logger = logging.getLogger(__name__)


class AudioProcessor:
    """Handles audio conversion and processing using numpy and wave"""

    def __init__(self, sample_rate: int = 16000):
        """
        Initialize audio processor

        Args:
            sample_rate: Sample rate for audio processing (Whisper uses 16kHz)
        """
        self.sample_rate = sample_rate

    def load_audio(self, file_path: str) -> np.ndarray:
        """
        Load audio file and convert to numpy array

        Args:
            file_path: Path to audio file

        Returns:
            Audio data as numpy array
        """
        logger.info(f"Loading audio from {file_path}")

        try:
            with wave.open(file_path, 'rb') as wav_file:
                # Get audio parameters
                n_channels = wav_file.getnchannels()
                sampwidth = wav_file.getsampwidth()
                framerate = wav_file.getframerate()
                n_frames = wav_file.getnframes()

                logger.info(f"Audio info - Channels: {n_channels}, Sample width: {sampwidth}, "
                          f"Frame rate: {framerate}, Frames: {n_frames}")

                # Read audio data
                audio_data = wav_file.readframes(n_frames)

                # Convert to numpy array
                if sampwidth == 1:
                    dtype = np.uint8
                elif sampwidth == 2:
                    dtype = np.int16
                elif sampwidth == 4:
                    dtype = np.int32
                else:
                    raise ValueError(f"Unsupported sample width: {sampwidth}")

                audio_array = np.frombuffer(audio_data, dtype=dtype)

                # Convert to float32 normalized to [-1, 1]
                if dtype == np.uint8:
                    audio_array = (audio_array.astype(np.float32) - 128) / 128.0
                else:
                    audio_array = audio_array.astype(np.float32) / np.iinfo(dtype).max

                # Convert stereo to mono if necessary
                if n_channels == 2:
                    audio_array = audio_array.reshape(-1, 2).mean(axis=1)

                # Resample if necessary
                if framerate != self.sample_rate:
                    audio_array = self.resample(audio_array, framerate, self.sample_rate)

                return audio_array

        except Exception as e:
            logger.error(f"Error loading audio: {e}")
            raise

    def bytes_to_array(self, audio_bytes: bytes) -> np.ndarray:
        """
        Convert audio bytes to numpy array

        Args:
            audio_bytes: Raw audio data as bytes

        Returns:
            Audio data as numpy array
        """
        logger.info("Converting audio bytes to numpy array")

        try:
            # Create a BytesIO object to treat bytes as a file
            audio_io = io.BytesIO(audio_bytes)

            with wave.open(audio_io, 'rb') as wav_file:
                # Get audio parameters
                n_channels = wav_file.getnchannels()
                sampwidth = wav_file.getsampwidth()
                framerate = wav_file.getframerate()
                n_frames = wav_file.getnframes()

                # Read audio data
                audio_data = wav_file.readframes(n_frames)

                # Convert to numpy array
                if sampwidth == 1:
                    dtype = np.uint8
                elif sampwidth == 2:
                    dtype = np.int16
                elif sampwidth == 4:
                    dtype = np.int32
                else:
                    raise ValueError(f"Unsupported sample width: {sampwidth}")

                audio_array = np.frombuffer(audio_data, dtype=dtype)

                # Convert to float32 normalized to [-1, 1]
                if dtype == np.uint8:
                    audio_array = (audio_array.astype(np.float32) - 128) / 128.0
                else:
                    audio_array = audio_array.astype(np.float32) / np.iinfo(dtype).max

                # Convert stereo to mono if necessary
                if n_channels == 2:
                    audio_array = audio_array.reshape(-1, 2).mean(axis=1)

                # Resample if necessary
                if framerate != self.sample_rate:
                    audio_array = self.resample(audio_array, framerate, self.sample_rate)

                return audio_array

        except Exception as e:
            logger.error(f"Error converting bytes to array: {e}")
            raise

    def save_audio(self, audio_array: np.ndarray, output_path: str, sample_rate: int = None):
        """
        Save numpy array as WAV file

        Args:
            audio_array: Audio data as numpy array
            output_path: Path to save the audio file
            sample_rate: Sample rate (uses default if not specified)
        """
        if sample_rate is None:
            sample_rate = self.sample_rate

        logger.info(f"Saving audio to {output_path}")

        try:
            # Convert to int16
            audio_int16 = (audio_array * 32767).astype(np.int16)

            with wave.open(output_path, 'w') as wav_file:
                # Set parameters: 1 channel (mono), 2 bytes per sample, sample rate
                wav_file.setnchannels(1)
                wav_file.setsampwidth(2)
                wav_file.setframerate(sample_rate)

                # Write audio data
                wav_file.writeframes(audio_int16.tobytes())

            logger.info(f"Audio saved successfully to {output_path}")

        except Exception as e:
            logger.error(f"Error saving audio: {e}")
            raise

    def resample(self, audio_array: np.ndarray, orig_sr: int, target_sr: int) -> np.ndarray:
        """
        Simple resampling using linear interpolation

        Args:
            audio_array: Original audio data
            orig_sr: Original sample rate
            target_sr: Target sample rate

        Returns:
            Resampled audio array
        """
        if orig_sr == target_sr:
            return audio_array

        logger.info(f"Resampling from {orig_sr}Hz to {target_sr}Hz")

        # Calculate the ratio
        ratio = target_sr / orig_sr

        # Calculate new length
        new_length = int(len(audio_array) * ratio)

        # Create indices for interpolation
        old_indices = np.arange(len(audio_array))
        new_indices = np.linspace(0, len(audio_array) - 1, new_length)

        # Perform linear interpolation
        resampled = np.interp(new_indices, old_indices, audio_array)

        return resampled

    def normalize_audio(self, audio_array: np.ndarray) -> np.ndarray:
        """
        Normalize audio to [-1, 1] range

        Args:
            audio_array: Audio data

        Returns:
            Normalized audio array
        """
        max_val = np.abs(audio_array).max()
        if max_val > 0:
            return audio_array / max_val
        return audio_array

    def trim_silence(self, audio_array: np.ndarray, threshold: float = 0.01) -> np.ndarray:
        """
        Trim silence from the beginning and end of audio

        Args:
            audio_array: Audio data
            threshold: Amplitude threshold for silence detection

        Returns:
            Trimmed audio array
        """
        # Find non-silent regions
        non_silent = np.abs(audio_array) > threshold

        if not non_silent.any():
            return audio_array

        # Find start and end indices
        non_silent_indices = np.where(non_silent)[0]
        start_idx = non_silent_indices[0]
        end_idx = non_silent_indices[-1] + 1

        return audio_array[start_idx:end_idx]

    def get_duration(self, audio_array: np.ndarray) -> float:
        """
        Get duration of audio in seconds

        Args:
            audio_array: Audio data

        Returns:
            Duration in seconds
        """
        return len(audio_array) / self.sample_rate

    def array_to_bytes(self, audio_array: np.ndarray) -> bytes:
        """
        Convert numpy array to WAV bytes

        Args:
            audio_array: Audio data as numpy array

        Returns:
            WAV format bytes
        """
        # Convert to int16
        audio_int16 = (audio_array * 32767).astype(np.int16)

        # Create in-memory bytes buffer
        buffer = io.BytesIO()

        with wave.open(buffer, 'wb') as wav_file:
            wav_file.setnchannels(1)
            wav_file.setsampwidth(2)
            wav_file.setframerate(self.sample_rate)
            wav_file.writeframes(audio_int16.tobytes())

        return buffer.getvalue()

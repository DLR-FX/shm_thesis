import numpy as np
import matplotlib.pyplot as plt

# Define signal parameters
amplitude = 1.0
frequency = 2*np.pi/25
phase = np.pi
offset = 0.5
duration = 100
sampling_rate = 100

# Generate time axis
t = np.arange(0, duration, 1/sampling_rate)

# Generate clean signal
clean_signal = amplitude*np.sin(frequency*t + phase) + offset

# Generate noisy signal
noise_amplitude = 0.1
noisy_signal = clean_signal + noise_amplitude*np.random.randn(len(t))

# Plot clean and noisy signals
fig, axs = plt.subplots(1, 2, figsize=(10, 4), sharey=True)
axs[0].plot(t, clean_signal, 'b-', label='Clean')
axs[0].plot(t, noisy_signal, 'r-', label='Noisy')
axs[0].set_xlabel('Time (s)')
axs[0].set_ylabel('Amplitude')
axs[0].legend()

# Plot PDF and PMF of noisy signal
bins = np.linspace(-2, 2, 200)
hist, bin_edges = np.histogram(noisy_signal, bins=bins, density=True)
pmf = hist*np.diff(bin_edges)
pdf = pmf/sampling_rate
bin_centers = (bin_edges[1:] + bin_edges[:-1])/2

axs[1].barh(bin_centers, pmf, height=0.1, label='PMF')
axs[1].plot(pdf, bin_centers, 'r-', label='PDF')
axs[1].set_xlabel('Probability')
axs[1].set_ylabel('Amplitude')
axs[1].legend()

plt.show()

import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import norm

# Generate a sine wave with added noise and an offset
x = np.linspace(0, 10, 1000)
y = np.sin(x) + np.random.normal(scale=0.2, size=1000) + 0.5

# Calculate the mean and standard deviation of the signal
mean = np.mean(y)
std = np.std(y)

# Compute the histogram of the signal and normalize to obtain the PDF
counts, edges = np.histogram(y, bins=20, density=False)
pdf = counts / (np.sum(counts) * np.diff(edges))

# Calculate the signal-to-noise ratio (SNR)
snr = np.abs(mean) / std

# Plot the noisy signal and save as version 1
plt.plot(x, y)
plt.xlabel('Time')
plt.ylabel('Amplitude')
plt.title('Noisy Sine Signal')
plt.tight_layout()
plt.grid(True)
plt.savefig('images/statistic_functions_clean.pdf')
plt.show()

# Plot the signal with mean and standard deviation and save as version 2
plt.plot(x, y, label='Noisy Signal')
plt.axhline(y=mean, color='r', linestyle='-', label='Mean')
plt.axhline(y=mean+std, color='g', linestyle='--', label='Mean + Std')
plt.axhline(y=mean-std, color='g', linestyle='--', label='Mean - Std')
plt.xlabel('Time')
plt.ylabel('Amplitude')
plt.title('Sine Signal with Mean and Standard Deviation')
plt.legend()
plt.grid(True)
plt.tight_layout()
plt.savefig('images/statistic_functions_basic.pdf')
plt.show()

# Plot the full signal with PMF and SNR and save as version 3
fig, (ax1, ax2) = plt.subplots(1, 2, gridspec_kw={'width_ratios': [3, 1]})
ax1.plot(x, y, label='Noisy Signal')
ax1.axhline(y=mean, color='r', linestyle='-', label='Mean')
ax1.axhline(y=mean+std, color='g', linestyle='--', label='Mean + Std')
ax1.axhline(y=mean-std, color='g', linestyle='--', label='Mean - Std')
ax1.set_xlabel('Time')
ax1.set_ylabel('Amplitude')
ax1.set_title('Sine Signal with Added Noise')
ax1.legend()
ax1.grid(True)

ax2.barh(edges[:-1],pdf, height=0.2, alpha=0.5, color='purple')
ax2.set_title('Histogram')
ax2.set_xlabel('PDF')
ax2.set_ylabel('Amplitude')

ax1.text(0.05, 0.95, f'SNR: {snr:.2f}', transform=ax1.transAxes, ha='left', va='top')
fig.tight_layout()
plt.savefig('images/statistic_functions_full.pdf')
plt.show()

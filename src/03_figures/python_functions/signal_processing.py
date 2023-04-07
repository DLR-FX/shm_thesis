import numpy as np
import matplotlib.pyplot as plt

# generate sin curve with offset
x = np.linspace(0, 5*np.pi, 250)
y = np.sin(x) + 0.5

# add random noise
y_noise = y + np.random.normal(0, 0.2, len(y))

# discretize value
y_discretized = np.round(y_noise * 2) / 2

# calculate errors
error_discretized = y_discretized - y
error_noisy = y_noise - y
error_discretization_noise = y_discretized-y_noise

# plot original signal
fig, axs = plt.subplots(1, 3, figsize=(10, 8))
axs[0].plot(x, y, label='Original Sin Curve')
#axs[0].plot(x, y_noise, label='Sin Curve with Noise')
#axs[0].plot(x, y_discretized, label='Discretized Sin Curve with Noise')
axs[0].set_ylim([-1.2, 2.2])
axs[0].legend()
axs[0].set_title("Point 1: Original Signal")

# plot curves and errors
axs[1].plot(x, y_noise, label='Sin Curve with Noise')
axs[1].plot(x, error_noisy, label='Error (Noisy Signal)')
axs[1].set_ylim([-1.2, 2.2])
axs[1].legend()
axs[1].set_title("Point 2: Analog Sensor Signal")

axs[2].plot(x, y_discretized, label='Discretized Sin Curve with Noise')
#axs[2].plot(x, error_discretization_noise, label='Error (Discretization Noise)')
axs[2].plot(x, error_discretized, label='Error (Discretized )')
axs[2].set_ylim([-1.2, 2.2])
axs[2].legend()
axs[2].set_title("Point 3: Discretized Sensor Signal")

fig.set_size_inches((12, 3.5), forward=False)
fig.tight_layout()
plt.savefig("images/signal_processing_plots.pdf")
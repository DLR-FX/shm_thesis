import pandas as pd
import numpy as np
import matplotlib.pyplot as plt


def statistics(ax, x, y, ):
    y_mean = np.full(100, y.mean())
    ax.plot(x, y, "black")
    ax.plot(x, y_mean, "red", label=r"$\mu$")
    ax.plot(x, y_mean - y.std(), "blue", label=r"$\mu\pm\sigma$")
    ax.plot(x, y_mean + y.std(), "blue")

    ax.set_xticklabels([])
    ax.legend(loc="upper right")
    # signal to noise ratio
    snr = y.mean() / y.std()
    # coefficient of variation
    cv = y.std() / y.mean()
    display_string = r"$SNR=" + str(snr) + r", \ \CV=" + str(cv) + r"$"
    plt.text(60, .025, display_string)

    return ax


# generate random signal for a mean of 0.5
multiplier = 3
x = np.linspace(0, 99, 100)
y_noise = (np.random.rand(100) - 0.5) * 2 * multiplier
y_sin = np.sin(x / 5) * multiplier
y_double_sin = (y_sin + np.sin((x + 10) / (2 * 4)) * multiplier) / 2
signals = [y_noise, y_sin, y_double_sin]

fig, ax = plt.subplots()
ax.axis("off")
statistics(ax, x, y_noise)
plt.savefig("images/basic_signal_0.eps", format="eps")

fig, ax = plt.subplots(len(signals))
for n, y in enumerate(signals):
    statistics(ax[n], x, y)

    # normal distribution
    # plt.hist()
    # covariance plot

# save the noise plot

plt.savefig("images/fundamentals_signals")

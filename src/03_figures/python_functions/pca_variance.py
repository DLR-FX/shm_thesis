import numpy as np
import matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression

# Generate random data
x = np.random.rand(50)
y = x + np.random.randn(50)*0.3

# Plot the data
plt.scatter(x, y, color='blue', alpha=0.5)

# Scale the axes to have the same dimension
plt.axis('equal')

# Fit a linear regression line
model = LinearRegression().fit(x.reshape(-1, 1), y.reshape(-1, 1))
x_fit = np.linspace(-0.5, 1.5, 100)
y_fit = model.predict(x_fit.reshape(-1, 1))


# Plot the linear regression line t_1
plt.plot(x_fit, y_fit, color='red', linewidth=2, label=r"$t_{1}$")

# Plot a line perpendicular to the linear regression line t_1
x0 = x.mean()
y0 = y.mean()
k = model.coef_[0]
b = y0 - k*x0
x_perp = np.linspace(0, 1, 100)
y_perp = -1/k * (x_perp - x0) + y0
plt.plot(x_perp, y_perp, '--', color='green', linewidth=2, label=r"$t_{2}$")

# Set the axis labels, title, and legend
plt.xlabel('x_1')
plt.ylabel('x_2')
plt.legend()

# Show the plot
plt.axis("equal")
plt.tight_layout()
plt.savefig("images/pca_variance.pdf")
plt.show()

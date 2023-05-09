import numpy as np
import pandas as pd


def calculate_distances(values):
    # calculate distance matrix
    distances = []
    distance = np.zeros([len(values), len(values)])
    for column in range(0, len(values)):
        for row in range(0, len(values)):
            distance[row, column] = abs(values[row] - values[column])
        distances.append(distance[:, column].sum())

    return distances

def invert_values(values):
    for value in values:
        value = 1/value
    return value
def normalize(values):
    pass


def weighted_fusion(df):
    # use vectorization
    index = 0
    values = df.values[index]
    # calculate distance
    distances = calculate_distances(values)

    # invert distances and normalize
    weights = invert_values(distances)
    weights = normalize(weights)

    # calculate distance matrix

    distance_sums = {}
    distance = pd.DataFrame(index=df.columns, columns=df.columns)
    for column_1 in df.columns:
        for column_2 in df.columns:
            distance[column_1][column_2] = abs(df[column_1][index] - df[column_2][index])

        distance_sums[column_1] = distance[column_1].sum()

    # generate weighted value for each index
    weights = {}
    for key in distance_sums.keys():
        weights[key] = 1 / distance_sums[key] ** 2

    # normalize weights

    weights = np.array(list(weights.values()))
    weights = weights / weights.sum()
    return np.sum(df * weights)


df = pd.DataFrame(data=[[1, 0.75, -1]], columns=["A", "B", "C"])

weighted_fusion(df)

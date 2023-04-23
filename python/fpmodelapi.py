import sys
from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
from flask import Flask, request, jsonify
import joblib
import traceback
from flask_ngrok import run_with_ngrok

dataset = pd.read_csv('inc_children_data_50.csv')

x = dataset.iloc[:, 2:].values
y = dataset.iloc[:, 0].values
for i in range(0, len(y)):
    y[i] = int(y[i].replace(",", ""))
# print(x)
# print(y)

x_train, x_test, y_train, y_test = train_test_split(
    x, y, test_size=1/3, random_state=0)
# print(x_train)
# print(x_test)
# print(y_train)
# print(y_test)

regressor = LinearRegression()
regressor.fit(x_train, y_train)

# x_test = [[2]]
# y_pred = regressor.predict(x_test)
# print(y_pred)

# Your API definition
app = Flask(__name__)
run_with_ngrok(app)


@app.route('/predict', methods=['POST'])
def predict():
    try:
        json_ = request.json
        print(json_)

        # query = pd.get_dummies(pd.DataFrame(json_))
        # print(query)
        # query = query.reindex(columns=model_columns, fill_value=0)

        prediction = round(float(regressor.predict(json_)[0]), 2)
        return jsonify({'prediction': str(prediction)})

    except:

        return jsonify({'trace': traceback.format_exc()})


if __name__ == '__main__':
    # If you don't provide any port the port will be set to 12345
    app.run()

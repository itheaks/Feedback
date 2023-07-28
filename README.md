# Feedback Application

## Description
The Feedback App is a Flutter-based Android application that allows users to provide their feedback by entering their name and feedback message. The app calculates the positivity percentage of the feedback and displays it with a color-coded box.

## Screenshots
#### Ios / Android
![image](https://github.com/itheaks/Feedback/assets/134759689/981453c1-09fd-4b50-aadb-78a18e5bc944)

#### Web / Desktop
![image](https://github.com/itheaks/Feedback/assets/134759689/b34b93fb-3fed-4a1f-8130-4ec9eebaa6b2)

## Features
- Input form to collect user feedback.
- Calculate positivity percentage based on the feedback.
- Display the color-coded box based on the positivity percentage.

## Word Datasets
The app utilizes three datasets to calculate the positivity percentage:

### Positive Words
Words in this dataset are considered positive and are assigned a value of +1.

Example positive words: excellent, outstanding, amazing, wonderful, fantastic.

### Negative Words
Words in this dataset are considered negative and are assigned a value of -1.

Example negative words: poor, bad, terrible, disappointing, frustrating.

### Modifier Words
Modifier words have the ability to change the sentiment of other words. In this dataset, modifier words are assigned a value of -2 because they can convert positive words into negative ones.

Example modifier words: not, never, no, don't.

## Technologies Used
- Flutter
- Dart


## Installation
1. Clone the repository
2. Open the project in your preferred Flutter development environment.
3. Run the app on an Android emulator or physical device.

## Usage
1. Enter your name and feedback in the provided input fields.
2. Click on the "Submit" button.
3. The app will calculate the positivity percentage based on the feedback and the word datasets.
4. It will then display the positivity percentage along with a color-coded box:
   - Green: Positivity percentage > 60%
   - Yellow: Positivity percentage < 60% and > 40%
   - Red: Positivity percentage < 40%


## Contact
If you have any questions or feedback, feel free to reach out to us at [help@itheaks.com](mailto:amigonest@gmail.com). Help Us to Grow

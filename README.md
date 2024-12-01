
# Weather Application 🌦️

A simple and elegant Flutter application that provides real-time weather updates for any location using a weather API. This app demonstrates the use of `FutureBuilder` for asynchronous operations, effective API integration, and time handling in Flutter.

## Features ✨

- **Real-Time Weather Updates**: Fetches current weather data using a weather API.
- **FutureBuilder for Asynchronous UI**: Ensures seamless UI updates while fetching data.
- **Dynamic Time Display**: Shows local time of the selected location.
- **Clean and Responsive UI**: Optimized for both Android and iOS devices.

---

## Screenshots 📸
_(Add images of the app's UI here.)_

---

## Technologies Used 🛠️

- **Flutter**: Framework for building the application.
- **Dart**: Programming language used in Flutter.
- **Weather API**: Fetches real-time weather data (e.g., OpenWeatherMap, WeatherAPI).
- **FutureBuilder**: Handles asynchronous data fetching and rendering.
- **DateTime**: Manages and displays local time for various regions.

---

## Installation 🚀

1. Clone the repository:
   ```bash
   git clone https://github.com/your-repo/weather-app.git
   ```
2. Navigate to the project directory:
   ```bash
   cd weather-app
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the application:
   ```bash
   flutter run
   ```

---

## API Integration 🌐

1. Register for a free API key from a weather service provider, such as:
   - [OpenWeatherMap](https://openweathermap.org/api)
   - [WeatherAPI](https://www.weatherapi.com/)

2. Add your API key to the `api_constants.dart` file:
   ```dart
   const String apiKey = 'your_api_key';
   const String baseUrl = 'https://api.openweathermap.org/data/2.5/';
   ```

3. Example API call:
   ```dart
   final response = await http.get(Uri.parse('$baseUrl/weather?q=$city&appid=$apiKey'));
   ```

---

## Key Components 🧩

### **FutureBuilder**

`FutureBuilder` is used to handle asynchronous data fetching and render the appropriate UI states (loading, success, or error).

Example:
```dart
FutureBuilder(
  future: fetchWeatherData(city),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    } else if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      final weatherData = snapshot.data;
      return WeatherWidget(weatherData: weatherData);
    }
  },
);
```

### **Time Handling**

The `DateTime` class is used to display the current time in the selected location:
```dart
DateTime now = DateTime.now();
String formattedTime = DateFormat('hh:mm a').format(now);
```

---

# Screenshorts
<div>
  <img src="https://github.com/user-attachments/assets/c5383a8d-3f5c-4530-93a1-6f3bf716d2c2"height=500px>
  <img src="https://github.com/user-attachments/assets/5a273e21-6651-4425-bac3-4066d1f93222"height=500px>
  <img src="https://github.com/user-attachments/assets/31f58aa7-4758-4d99-a6b9-d6a6cebc1252"height=500px>
  <img src="https://github.com/user-attachments/assets/7e056922-c305-4c48-821d-5da75505babb"height=500px>
  <img src="https://github.com/user-attachments/assets/d35c9950-2836-4995-aa9d-9927407ec88c"height=500px>
  

</div>

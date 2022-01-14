const express = require('express');
const cors = require('cors'); 
const fetch=require('node-fetch')
const app = express();
app.use(cors());
var latitude;
var longtitude;
const axios = require('axios');
// const twitter=require('twit');
// const apiclient=new twitter({
//   consumer_key:''
// })

app.get('/', (req, res) => {
  latitude=req.query.latitude;
  longtitude=req.query.longtitude;

  //Qtv3sPp1ZYbDY2h1Q4Uri4Fmi2MBBi9f
  //aVBMJIkl9IQufXN5BAyQfAM90tGev49G
  //vfNJidC3lcxpFQyv1M6JTjZ5aS3zMKyF
  //
  const url = 'https://api.tomorrow.io/v4/timelines?units=metric&timesteps=1d&apikey=VxEvNqAPXDG214wTxYWpj39Ifd5im7Su'+
              '&location='+latitude+','+longtitude+'&fields=temperature&fields=humidity&fields=windSpeed'+
              '&fields=visibility&fields=temperatureMin&fields=temperatureMax&fields=weatherCode&fields=sunriseTime'+
              '&fields=sunsetTime&fields=precipitationProbability&fields=precipitationType&fields=cloudCover&fields=pressureSeaLevel';
    
  const options = {method: 'GET', headers: {Accept: 'application/json'}};
  fetch(url, options)
    .then(result => result.json())
    .then(resultjson => res.json(resultjson));

    // res.json({
    //   "data": {
    //     "timelines": [
    //       {
    //         "timestep": "1d",
    //         "startTime": "2021-12-06T14:00:00-08:00",
    //         "endTime": "2021-12-21T14:00:00-08:00",
    //         "intervals": [
    //           {
    //             "startTime": "2021-12-06T14:00:00-08:00",
    //             "values": {
    //               "temperature": 11.17,
    //               "humidity": 65,
    //               "windSpeed": 3.47,
    //               "visibility": 15.36,
    //               "temperatureMin": 2.81,
    //               "temperatureMax": 11.17,
    //               "weatherCode": 1001,
    //               "sunriseTime": "2021-12-06T15:15:00-08:00",
    //               "sunsetTime": "2021-12-07T01:15:00-08:00",
    //               "precipitationProbability": 0,
    //               "precipitationType": 0,
    //               "cloudCover": 100,
    //               "pressureSeaLevel": 1031,
    //               "uvIndex": 2
    //             }
    //           },
    //           {
    //             "startTime": "2021-12-07T14:00:00-08:00",
    //             "values": {
    //               "temperature": 10.55,
    //               "humidity": 93.83,
    //               "windSpeed": 1.87,
    //               "visibility": 13.9,
    //               "temperatureMin": 2.21,
    //               "temperatureMax": 10.55,
    //               "weatherCode": 1001,
    //               "sunriseTime": "2021-12-07T15:16:40-08:00",
    //               "sunsetTime": "2021-12-08T01:15:00-08:00",
    //               "precipitationProbability": 0,
    //               "precipitationType": 0,
    //               "cloudCover": 100,
    //               "pressureSeaLevel": 1027.39,
    //               "uvIndex": 1
    //             }
    //           },
    //           {
    //             "startTime": "2021-12-08T14:00:00-08:00",
    //             "values": {
    //               "temperature": 15.26,
    //               "humidity": 93.52,
    //               "windSpeed": 2.84,
    //               "visibility": 14.74,
    //               "temperatureMin": 1.7,
    //               "temperatureMax": 15.26,
    //               "weatherCode": 1000,
    //               "sunriseTime": "2021-12-08T15:16:40-08:00",
    //               "sunsetTime": "2021-12-09T01:15:00-08:00",
    //               "precipitationProbability": 0,
    //               "precipitationType": 0,
    //               "cloudCover": 10.94,
    //               "pressureSeaLevel": 1024.8,
    //               "uvIndex": 2
    //             }
    //           },
    //           {
    //             "startTime": "2021-12-09T14:00:00-08:00",
    //             "values": {
    //               "temperature": 15.15,
    //               "humidity": 89.25,
    //               "windSpeed": 5.91,
    //               "visibility": 24.14,
    //               "temperatureMin": 2.92,
    //               "temperatureMax": 15.15,
    //               "weatherCode": 1001,
    //               "sunriseTime": "2021-12-09T15:16:40-08:00",
    //               "sunsetTime": "2021-12-10T01:15:00-08:00",
    //               "precipitationProbability": 50,
    //               "precipitationType": 1,
    //               "cloudCover": 100,
    //               "pressureSeaLevel": 1024.63,
    //               "uvIndex": 2
    //             }
    //           },
    //           {
    //             "startTime": "2021-12-10T14:00:00-08:00",
    //             "values": {
    //               "temperature": 9.4,
    //               "humidity": 89.61,
    //               "windSpeed": 4.8,
    //               "visibility": 24.14,
    //               "temperatureMin": 4.86,
    //               "temperatureMax": 9.4,
    //               "weatherCode": 1001,
    //               "sunriseTime": "2021-12-10T15:20:00-08:00",
    //               "sunsetTime": "2021-12-11T01:15:00-08:00",
    //               "precipitationProbability": 45,
    //               "precipitationType": 1,
    //               "cloudCover": 100,
    //               "pressureSeaLevel": 1027.98,
    //               "uvIndex": 1
    //             }
    //           },
    //           {
    //             "startTime": "2021-12-11T14:00:00-08:00",
    //             "values": {
    //               "temperature": 11.7,
    //               "humidity": 81.71,
    //               "windSpeed": 4.05,
    //               "visibility": 24.14,
    //               "temperatureMin": 3.45,
    //               "temperatureMax": 11.7,
    //               "weatherCode": 1001,
    //               "sunriseTime": "2021-12-11T15:20:00-08:00",
    //               "sunsetTime": "2021-12-12T01:15:00-08:00",
    //               "precipitationProbability": 0,
    //               "precipitationType": 0,
    //               "cloudCover": 100,
    //               "pressureSeaLevel": 1030.52
    //             }
    //           },
    //           {
    //             "startTime": "2021-12-12T14:00:00-08:00",
    //             "values": {
    //               "temperature": 7.67,
    //               "humidity": 58.93,
    //               "windSpeed": 2.99,
    //               "visibility": 24.14,
    //               "temperatureMin": -0.59,
    //               "temperatureMax": 7.67,
    //               "weatherCode": 1000,
    //               "sunriseTime": "2021-12-12T15:20:00-08:00",
    //               "sunsetTime": "2021-12-13T01:15:00-08:00",
    //               "precipitationProbability": 0,
    //               "precipitationType": 0,
    //               "cloudCover": 79.03,
    //               "pressureSeaLevel": 1028.2
    //             }
    //           },
    //           {
    //             "startTime": "2021-12-13T14:00:00-08:00",
    //             "values": {
    //               "temperature": 10.31,
    //               "humidity": 56.22,
    //               "windSpeed": 5.3,
    //               "visibility": 24.14,
    //               "temperatureMin": -0.24,
    //               "temperatureMax": 10.31,
    //               "weatherCode": 1000,
    //               "sunriseTime": "2021-12-13T15:21:40-08:00",
    //               "sunsetTime": "2021-12-14T01:15:00-08:00",
    //               "precipitationProbability": 0,
    //               "precipitationType": 0,
    //               "cloudCover": 54.95,
    //               "pressureSeaLevel": 1021.14
    //             }
    //           },
    //           {
    //             "startTime": "2021-12-14T14:00:00-08:00",
    //             "values": {
    //               "temperature": 13.68,
    //               "humidity": 58.02,
    //               "windSpeed": 4.07,
    //               "visibility": 24.14,
    //               "temperatureMin": 2.98,
    //               "temperatureMax": 13.68,
    //               "weatherCode": 1001,
    //               "sunriseTime": "2021-12-14T15:21:40-08:00",
    //               "sunsetTime": "2021-12-15T01:16:40-08:00",
    //               "precipitationProbability": 0,
    //               "precipitationType": 0,
    //               "cloudCover": 91.27,
    //               "pressureSeaLevel": 1021.8
    //             }
    //           },
    //           {
    //             "startTime": "2021-12-15T14:00:00-08:00",
    //             "values": {
    //               "temperature": 11.29,
    //               "humidity": 57.17,
    //               "windSpeed": 2.74,
    //               "visibility": 24.14,
    //               "temperatureMin": 2.64,
    //               "temperatureMax": 11.29,
    //               "weatherCode": 1001,
    //               "sunriseTime": "2021-12-15T15:21:40-08:00",
    //               "sunsetTime": "2021-12-16T01:16:40-08:00",
    //               "precipitationProbability": 0,
    //               "precipitationType": 0,
    //               "cloudCover": 100,
    //               "pressureSeaLevel": 1024.99
    //             }
    //           },
    //           {
    //             "startTime": "2021-12-16T14:00:00-08:00",
    //             "values": {
    //               "temperature": 11.74,
    //               "humidity": 56.71,
    //               "windSpeed": 5.48,
    //               "visibility": 24.14,
    //               "temperatureMin": 3.29,
    //               "temperatureMax": 11.74,
    //               "weatherCode": 1000,
    //               "sunriseTime": "2021-12-16T15:23:20-08:00",
    //               "sunsetTime": "2021-12-17T01:16:40-08:00",
    //               "precipitationProbability": 0,
    //               "precipitationType": 0,
    //               "cloudCover": 88.85,
    //               "pressureSeaLevel": 1019.83
    //             }
    //           },
    //           {
    //             "startTime": "2021-12-17T14:00:00-08:00",
    //             "values": {
    //               "temperature": 7.68,
    //               "humidity": 60.13,
    //               "windSpeed": 9.4,
    //               "visibility": 24.14,
    //               "temperatureMin": -0.17,
    //               "temperatureMax": 7.68,
    //               "weatherCode": 1001,
    //               "sunriseTime": "2021-12-17T15:23:20-08:00",
    //               "sunsetTime": "2021-12-18T01:16:40-08:00",
    //               "precipitationProbability": 0,
    //               "precipitationType": 2,
    //               "cloudCover": 100,
    //               "pressureSeaLevel": 1029.09
    //             }
    //           },
    //           {
    //             "startTime": "2021-12-18T14:00:00-08:00",
    //             "values": {
    //               "temperature": 8.03,
    //               "humidity": 59.13,
    //               "windSpeed": 3.54,
    //               "visibility": 24.14,
    //               "temperatureMin": -0.24,
    //               "temperatureMax": 8.03,
    //               "weatherCode": 1100,
    //               "sunriseTime": "2021-12-18T15:23:20-08:00",
    //               "sunsetTime": "2021-12-19T01:16:40-08:00",
    //               "precipitationProbability": 0,
    //               "precipitationType": 0,
    //               "cloudCover": 74.5,
    //               "pressureSeaLevel": 1026.4
    //             }
    //           },
    //           {
    //             "startTime": "2021-12-19T14:00:00-08:00",
    //             "values": {
    //               "temperature": 10.53,
    //               "humidity": 36.87,
    //               "windSpeed": 4.61,
    //               "visibility": 24.14,
    //               "temperatureMin": 1.24,
    //               "temperatureMax": 10.53,
    //               "weatherCode": 1001,
    //               "sunriseTime": "2021-12-19T15:23:20-08:00",
    //               "sunsetTime": "2021-12-20T01:18:20-08:00",
    //               "precipitationProbability": 0,
    //               "precipitationType": 0,
    //               "cloudCover": 100,
    //               "pressureSeaLevel": 1024.48
    //             }
    //           },
    //           {
    //             "startTime": "2021-12-20T14:00:00-08:00",
    //             "values": {
    //               "temperature": 10.9,
    //               "humidity": 34.27,
    //               "windSpeed": 3.61,
    //               "visibility": 24.14,
    //               "temperatureMin": 1.78,
    //               "temperatureMax": 10.9,
    //               "weatherCode": 1101,
    //               "sunriseTime": "2021-12-20T15:26:40-08:00",
    //               "sunsetTime": "2021-12-21T01:18:20-08:00",
    //               "precipitationProbability": 0,
    //               "precipitationType": 0,
    //               "cloudCover": 100,
    //               "pressureSeaLevel": 1025.48
    //             }
    //           },
    //           {
    //             "startTime": "2021-12-21T14:00:00-08:00",
    //             "values": {
    //               "temperature": 2.41,
    //               "humidity": 35.19,
    //               "windSpeed": 3.25,
    //               "visibility": 24.14,
    //               "temperatureMin": 2.41,
    //               "temperatureMax": 2.41,
    //               "weatherCode": 1100,
    //               "sunriseTime": "2021-12-21T15:26:40-08:00",
    //               "sunsetTime": "2021-12-22T01:18:20-08:00",
    //               "precipitationProbability": 0,
    //               "precipitationType": 0,
    //               "cloudCover": 30.04,
    //               "pressureSeaLevel": 1028.44
    //             }
    //           }
    //         ]
    //       }
    //     ]
    //   },
    //   "warnings": [
    //     {
    //       "code": 246001,
    //       "type": "Time Bounded Field",
    //       "message": "The following field is not supported for a time range: 'uvIndex'",
    //       "meta": {
    //         "field": "uvIndex",
    //         "from": "2021-12-06T12:30:00-08:00",
    //         "to": "2021-12-11T11:08:00-08:00"
    //       }
    //     }
    //   ]
    // })
    
});

app.get('/current', (req, res) => {
  latitude=req.query.latitude;
  longtitude=req.query.longtitude;
  const url = 'https://api.tomorrow.io/v4/timelines?units=metric&timesteps=current&timezone=America/Los_Angeles&apikey=VxEvNqAPXDG214wTxYWpj39Ifd5im7Su'+
              '&location='+latitude+','+longtitude+'&fields=temperature&fields=humidity&fields=windSpeed'+
              '&fields=visibility&fields=weatherCode'+
              '&fields=precipitationProbability&fields=cloudCover&fields=pressureSeaLevel&fields=uvIndex';

  const options = {method: 'GET', headers: {Accept: 'application/json'}};
  fetch(url, options)
    .then(result => result.json())
    .then(resultjson => res.json(resultjson));
    // res.json({"data":{"timelines":[{"timestep":"current","startTime":"2021-12-07T17:04:00-08:00","endTime":"2021-12-07T17:04:00-08:00","intervals":[{"startTime":"2021-12-07T17:04:00-08:00","values":{"temperature":5.31,"humidity":56,"windSpeed":1.63,"visibility":13.9,"weatherCode":1001,"precipitationProbability":0,"cloudCover":100,"pressureSeaLevel":1033.12,"uvIndex":0}}]}]}})

    
});



app.get('/autocomplete', (req, res) => {
  // console.log(req.query.inputText+'"')
  const url1='https://maps.googleapis.com/maps/api/place/autocomplete/json'+
  '?input='+req.query.inputText+
  // '&location=37.76999%2C-122.44696'+
  // '&radius=500'+
  '&types=(cities)'+
  '&key=AIzaSyD9BnEyrsA8HgeAJcisPy7Qkege1nFpltM';
 

  axios({
    method: 'get',
    url: url1,
    headers: {Accept: 'application/json'},
    // responseType: 'json'
  })
  .then(function (response) {
    // console.log(response.data);
    res.json(response.data);
  });

});
app.get('/weathermeteogram', (req, res) => {
  latitude=req.query.latitude;
  longtitude=req.query.longtitude;
  const url = 'https://api.tomorrow.io/v4/timelines?units=metric&timesteps=1h&timezone=America/Los_Angeles&apikey=Qtv3sPp1ZYbDY2h1Q4Uri4Fmi2MBBi9f'+
              '&location='+latitude+','+longtitude+'&fields=temperature&fields=humidity'+
              '&fields=pressureSeaLevel&fields=windSpeed&fields=windDirection';
    
  const options = {method: 'GET', headers: {Accept: 'application/json'}};
  fetch(url, options)
    .then(result => result.json())
    .then(resultjson => res.json(resultjson));
    // .then(resultjson => console.log(resultjson));

});
const PORT = process.env.PORT || 8080;
app.listen(PORT, () => {
  console.log(`Server listening on port ${PORT}...`);
});
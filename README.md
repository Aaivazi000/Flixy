# Project 1 - *Flixy*

![Logo](https://github.com/Aaivazi000/Flixy/blob/master/Icon-App-83.5x83.5%402x.png)

**Flixy** is a movies app using the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

Time spent: **7** hours spent in total

## User Stories

The following **required** user stories are complete:

- [x] User sees app icon in home screen and styled launch screen (+1pt)
- [x] User can scroll through a list of movies currently playing in theaters from The Movie DB API (+5pt)
- [x] User can "Pull to refresh" the movie list (+2pt)
- [x] User sees a loading state while waiting for the movies to load (+2pt)

The following **stretch** user stories are implemented:

- [x] User sees an alert when there's a networking error (+1pt)
- [ ] User can search for a movie (+3pt)
- [ ] While poster is being fetched, user see's a placeholder image (+1pt)
- [ ] User sees image transition for images coming from network, not when it is loaded from cache (+1pt)
- [ ] Customize the selection effect of the cell (+1pt)
- [ ] For the large poster, load the low resolution image first and then switch to the high resolution image when complete (+2pt)

The following **additional** user stories are implemented:

- [x] I embeded a Tab Bar Controller in the app and there is a Trailers page which I hope to implement very soon (+1-3pts)
- [x] I designed my own app logo (see top of readme) and Launch logo (see below)
    - Launch Logo
        - ![Launch Logo](https://github.com/Aaivazi000/Flixy/blob/master/Icon-App-83.5x83.5%402x%20copy.png)

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. Adding Trailers to the app where trailers are played within the app.
2. Different UI layouts for the app.

## Video Walkthrough

Here's a walkthrough of implemented user stories:

#### Flixy Walkthrough without network connection
<img src='https://i.imgur.com/cFdHRir.gif' />

#### Flixy Walkthrough with network connection
<img src='https://i.imgur.com/pZKTE18.gif' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

No challenges encountered.

## License

    Copyright [2018] [Andriana Aivazians]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
    
# Project 2 - *Flixy*

![Logo](https://github.com/Aaivazi000/Flixy/blob/master/Icon-App-83.5x83.5%402x.png)

**Flixy** is a movies app displaying box office and top rental DVDs using [The Movie Database API](http://docs.themoviedb.apiary.io/#).

Time spent: **7** hours spent in total

## User Stories

The following **required** functionality is completed:

- [x] User can tap a cell to see a detail view (+5pts)
- [x] User can tap a tab bar button to view a grid layout of Movie Posters using a CollectionView (+5pts)

The following **stretch** features are implemented:

- [x] User can tap a poster in the collection view to see a detail screen of that movie (+3pts)
- [x] In the detail view, when the user taps the poster, a new screen is presented modally where they can view the trailer (+3pts)
- [x] Customize the navigation bar (+1pt)
    - Navigation bar throughout the app is customized to a color scheme consisting of black, dark grey, white, and yellow.
- [x] Users sees a yellow box when the movie poster has not loaded yet and a white box when the backdrop poster has not loaded.

The following **additional** features are implemented:

- [x] The movies shown in the Trailers tab Collection View are Upcoming Movies.
- [x] The detail view presented after selecting a TableView cell (in Now Playing) shows the vote average for the movie.
- [x] The detail view presented after selecting a CollectionView cell (in Trailers) shows the vote average for the movie.

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. How to implement the search bar
2. How to overlay a play button on a UIImage (to get rid of the "Watch Trailer" button)

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://i.imgur.com/Nh2buqV.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

If you cannot see the gif walthrough due to length restrictions [click here to view in browser](https://imgur.com/Nh2buqV).

## Notes

Describe any challenges encountered while building the app.

## License

    Copyright [2018] [Andriana Aivazians]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
    
# Lab 3 - *Flixy*

![Logo](https://github.com/Aaivazi000/Flixy/blob/master/Icon-App-83.5x83.5%402x.png)

**Flixy** is a movies app displaying box office and top rental DVDs using [The Movie Database API](http://docs.themoviedb.apiary.io/#).

Time spent: **5** hours spent in total

## User Stories

The following **required** user stories are complete:

- The following screens use AutoLayout to adapt to various orientations and screen sizes
   - [x] Movie feed view (+3pt)
   - [x] Detail view (+2pt)

The following **stretch** user stories are implemented:

- [ ] Dynamic Height Cells (+1)
- [x] Collection View AutoLayout (+2)

The following **additional** user stories are implemented:

- [X] Fixed Ratings in Detail View for Trailers tab to handle movies with no ratings.
- [X] Users can now watch trailers for Now Playing movies too.
- [X] Added constraints to Detail View to suport Portait mode in muliple iOS devices

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. Implementing the Search bar to update dynamically
2. Adding Launch Animations to apps.

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/link/to/your/gif/file.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Cannot get constraints to work in Upcoming Detail View Controller in Landscape mode.

## License

    Copyright [2018] [Andriana Aivazians]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

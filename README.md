# SwiftUI-Weather-App<a name="readme-top"></a> 
A weather app for iOS written in SwiftUI. Created as part of the mobile development iOS module at Westminster University.
#### Built With SwiftUI framework
[![Swift][Swift.com]][Swift-url] [![Xcode][Xcode.com]][Xcode-url] 

<!-- Technologies Used -->
<details>
  <summary>Technologies Used</summary>
  <ol>
    <li>Swift</li>
    <li>Swift UI Framework</li>
    <li>Xcode 13</li>
  </ol>
</details>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#general-info">General Info</a></li>
    <li><a href="#app-screenshots">App Screenshots</a></li>
    <li><a href="#setup">Setup</a></li>
    <li><a href="#further-requirements">Further Requirements</a></li>
    <li><a href="#project-status">Project Status</a></li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#improvement">Room for Improvement</a></li>
     <li><a href="#project-status">Status</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>

<!-- general-info -->
## General Info
- This project is the final coursework of the mobile development module at University of Westminster.
- The target learning outcomes are:
    - SwiftUI basics + layout
    - Model creation based on retrieved JSON data
    - Decoding JSON data and displaying in a list
- App used to quickly parse JSON data: https://app.quicktype.io/

<!-- app-screenshots -->
## App screenshots

Main Page | Detail Page | Hourly Forecast Page
:-----------------------:|:-----------------------:|:-----------------------:
![Simulator Screen Shot - iPhone 14 Pro - 2022-10-19 at 13 16 35](https://user-images.githubusercontent.com/78150846/196710481-c5325461-4362-42f8-a3d8-d1d46176ba77.png)|![Simulator Screen Shot - iPhone 14 Pro - 2022-10-19 at 13 16 51](https://user-images.githubusercontent.com/78150846/196736415-6ef52c2e-cd6b-4eb2-8c9e-fb47284a8dd1.png)| ![Simulator Screen Shot - iPhone 14 Pro - 2022-10-19 at 13 17 04](https://user-images.githubusercontent.com/78150846/196736461-6d57d2f6-32c8-4466-9aa4-5bd59aca63ec.png)

<!-- setup -->

## Setup
To run this app, you will need the following:
  - A MacOS Machine
  - Access to XCode IDE
  - To test on physical device, iPhone with iOS 15+ is required.

<!-- further-requirements -->
### Further requirements
1. Get a free API Key at [https://openweathermap.org/price](https://openweathermap.org/price)
2. Clone the repo
   ```sh
   git clone https://github.com/Vasil1001/SwiftUI-Weather-App.git
   ```
3. Replace the apiKey at the end of 'WeatherAPI' page in 'Models' folder with the one from your account. 
   ```js
   let apiKey: String = "ENTER YOUR API";
   ```
<!-- usage -->
## Usage
- Type a city in the search bar and press the search button to display city temperature on main screen.
- Afterwards, tap details page to get further details for the selected city.
- Lastly, tap 5 day forecast page to retrieve hourly forecast for the selected city in a list.

<!-- improvement -->
## Improvement
- Fix alert message bug when location not found.
- To recreate bug: Type wrong location - alert shows, type correct location - alert shows up again for a few seconds then dissapears.

<!-- project-status -->
## Project Status
Project is: _done_

<!-- contact -->
## Contact
Created by [Vasil] - feel free to contact me!
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
<!--  [![Next][Next.js]][Next-url] [![React][React.js]][React-url] [![Vue][Vue.js]][Vue-url] [![Bootstrap][Bootstrap.com]][Bootstrap-url] [![JQuery][JQuery.com]][JQuery-url] -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/github_username/repo_name.svg?style=for-the-badge
[contributors-url]: https://github.com/github_username/repo_name/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/github_username/repo_name.svg?style=for-the-badge
[forks-url]: https://github.com/github_username/repo_name/network/members
[stars-shield]: https://img.shields.io/github/stars/github_username/repo_name.svg?style=for-the-badge
[stars-url]: https://github.com/github_username/repo_name/stargazers
[issues-shield]: https://img.shields.io/github/issues/github_username/repo_name.svg?style=for-the-badge
[issues-url]: https://github.com/github_username/repo_name/issues
[license-shield]: https://img.shields.io/github/license/github_username/repo_name.svg?style=for-the-badge
[license-url]: https://github.com/github_username/repo_name/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/linkedin_username
[product-screenshot]: images/screenshot.png
[Next.js]: https://img.shields.io/badge/next.js-000000?style=for-the-badge&logo=nextdotjs&logoColor=white
[Next-url]: https://nextjs.org/
[React.js]: https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB
[React-url]: https://reactjs.org/
[Vue.js]: https://img.shields.io/badge/Vue.js-35495E?style=for-the-badge&logo=vuedotjs&logoColor=4FC08D
[Vue-url]: https://vuejs.org/
[Angular.io]: https://img.shields.io/badge/Angular-DD0031?style=for-the-badge&logo=angular&logoColor=white
[Angular-url]: https://angular.io/
[Svelte.dev]: https://img.shields.io/badge/Svelte-4A4A55?style=for-the-badge&logo=svelte&logoColor=FF3E00
[Svelte-url]: https://svelte.dev/
[Laravel.com]: https://img.shields.io/badge/Laravel-FF2D20?style=for-the-badge&logo=laravel&logoColor=white
[Laravel-url]: https://laravel.com
[Bootstrap.com]: https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white
[Bootstrap-url]: https://getbootstrap.com
[JQuery.com]: https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jquery&logoColor=white
[JQuery-url]: https://jquery.com 
[Xcode.com]: https://img.shields.io/badge/Xcode-007ACC?style=for-the-badge&logo=Xcode&logoColor=white
[Xcode-url]: https://developer.apple.com/xcode/
[Swift.com]: https://img.shields.io/badge/swift-F54A2A?style=for-the-badge&logo=swift&logoColor=white
[Swift-url]: https://docs.swift.org/swift-book/

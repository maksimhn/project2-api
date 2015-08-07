== README

This application is made my Maksim Hranin as a part of individual full-stack project at General Assembly. The database serves data for client-side quizz-like guessing game that's designed to help people learning German. It holds the following data:

  - User information
  - Pool of German nouns with genders specified and links to pictures
  - Quiz information that accumulates user-specific data: quizzes taken,
    results; it's connected to words and users by one-to-many relation from each side

The app is written in Ruby. Rails framework implements the standart MVC app structure. List of Ruby gems can be found at "Gemfile".

Users are allowed to create/delete login information, request words from the pool and update quizzes storage. They also can update noun's gender should they notice a mistake.

DB structure (ERDs) are accessible here:
https://drive.google.com/file/d/0B4QTOXKp5fo1alJDa0p5emVTNEU/view?usp=sharing

Client-side application is hosted at:
http://maksimhn.github.io/Project2-FE-MD/

Client-side GitHub repo can be found here:
https://github.com/maksimhn/Project2-FE-MD

Server-side application is hosted at:
https://powerful-sands-2723.herokuapp.com

Server-side GitHub repo can be found here:
https://github.com/maksimhn/project2-api


July 2015
Maksim Hranin
https://www.linkedin.com/in/mhranin
General Assembly WDI student

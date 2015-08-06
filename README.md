== README

This application is made my Maksim Hranin as a part of individual full-stack project at General Assembly. The database serves data for client-side quizz-like guessing game that's designed to help people learning German. It holds the following data:

  - User information
  - Pool of German nouns with genders specified and links to pictures
  - Quiz information that accumulates user-specific data: quizzes taken,
    results; it's connected to words and users by one-to-many relation from each side

The app is written in Ruby. Rails framework implements the standart MVC app structure. List of Ruby gems can be found at "Gemfile".

Users are allowed to create/delete login information, request words from the pool and update quizzes storage. They also can update noun's gender should they notice a mistake.

Client-side application is located at:
http://maksimhn.github.io/Project2-FE-MD/

LinkedIn profile:
https://www.linkedin.com/in/mhranin

August 2015
Maksim Hranin

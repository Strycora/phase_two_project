# Readme - Dragon Hunter

## Introduction
The Dragon Hunter application is the premier tool for adventurers who seek to document the dragons they are looking for or have found in the wild. Full CRUD (Create, Read, Update, Delete) functionality is included with respect to Dragons.

## Technologies
This application is written in Ruby (2.1.4) and utilizes Sinatra for rendering web pages, ActiveRecord for models, SQLite3 for the database, and Bcrypt for user authentication.

## Launch
In order to run this application, clone this Github repo and run the command 'bundle install'. Then run 'rake db:migrate' and 'shotgun'. Finally, click on the link to the URL at which the application is hosted and sign up with a new username and password. Then click on 'New Dragon' and fill out the fields with the dragon's name, color, personality, etc. and the dragon will be added to the user's list of dragons.

## Features
- Users can document a new dragon, edit a dragon that they have listed, or delete a dragon.
- Depending on the dragon's color, one of 7 dragon images will be displayed on the dragon's show page.
- Includes a 'recently viewed' that displays the name of the last dragon that was created or viewed.
- Users and dragons are associated with a has many/belongs to relationship that makes it so that a user can only view the dragons created under that profile.

## License
https://github.com/Strycora/phase_two_project/blob/main/LICENSE


## Image sources:

https://www.deviantart.com/laurelhach23/art/Purple-Dragon-753607681

https://www.redbubble.com/people/glowfish/works/32727579-yellow-dragon

https://hellintheearth.fandom.com/wiki/Black_Dragon

https://monster.fandom.com/wiki/White_Dragon

https://forgottenrealms.fandom.com/wiki/Red_dragon

https://www.dndbeyond.com/monsters/adult-blue-dragon

https://www.deviantart.com/sandara/art/Green-Dragon-v2-579637253

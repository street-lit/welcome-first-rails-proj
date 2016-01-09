# Description
For this app, I built a rails app that returns users from a database given the correct URL.

## To run
Enter the root directory and open your command line interface of choice.  Within the root folder, enter the command `rails server` to start the application.  In order to view the application, open up your web browser of choice and go to the url: `localhost:3000`

If your application is running successfully, you should see the prompt that displays the words: <br><br>
<strong>Welcome aboard</strong> 
<em>You're riding Ruby on Rails!</em>

## Commands

### View all users
In order to view all users from the database, the user must enter a url in the format: `http://localhost:3000/users`

### View individual records
In order to view an individual user from the database, the user must enter a url in the format: `http://localhost:3000/users/1`

In case a record is requested that doesn't exist, such as entering the url: `http://localhost:3000/users/9999999` the user will see an error message.

### View certain users with queries
In order to view specific users whose name starts with a certain character from the database, enter a url in the format: `http://localhost:3000/users?first_name=s`

### View certain users with queries
In order to view a certain limit of users with an offset from the database, the user must enter a url in the following format: `http://localhost:3000/users?limit=10&offset=10`

### Deleting a user
In order to delete a certain user from the database, the user must enter a url in the following format: `http://localhost:3000/users/1/delete`

### Adding a user to the database
In order to add a user to the database, the user must enter a url in the following format: `http://localhost:3000/users/create?first_name=John&last_name=Smith&age=99`
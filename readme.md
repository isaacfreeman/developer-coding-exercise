# Media Suite Coding Exercise

Here's my implementation of the blog exercise.

As discussed, I've used a Ruby on Rails server and a React client built with [create-react-app](https://create-react-app.dev).

## Running locally

### Rails server
```sh
cd server
gem install bundler
bundle
bundle exec rails server -p4000
```

Both Rails and npm use port 3000 out of the box, so it's necessary to specify a different port for the server. The client is hard-coded to look for it on port 4000.

### React client
```sh
cd ../client
npm install
npm start
```

## Notes

I was able to complete the basic functionality in two hours, but there's a lot more I'd do for a real project.

### Tests
The code lacks tests!
For most real projects I'd typically start with a some quick-and-dirty skeleton code to explore the problem. This allows me to determine whether I've understood the requirements correctly, whether there are any hidden gotchas, and whether my initial time estimates are accurate.
Once I've seen the main features working, I shift gears to a more test-driven approach. I prefer to have fairly complete unit tests to cover the code, along with one or two integration tests demonstrating that some mission-critical features work correctly end-to-end.

For this code, I'd expect to implement RSpec tests for the two methods in PostsController, and for each of the public methods on the Post class. On the React side, I'd use Jest to test each of the components.

### Error handling
I've implemented some basic boilerplate code for error handling in the React client, but ran out of time to report errors properly from the server side. I'd consider this necessary for a real MVP.

### Tags
The tags feature is present with stop words, but pretty basic. I see that it currently reports some Markdown code as tags, and doesn't handle punctuation or smart apostroophes well. These would be good areas to flesh out with a test-driven approach.

### Readability
For a real project, I'd also expect to spend some time making the code more readable for the next developer who needs to pick it up. This would include basic linting wiith Rubocop and ESLint (or similar) to conform with whatever style conventions the project is using. Also though, I'd want to sepnd some time refactoring for clarity. Some of the methods in the Posts model have long functional chains that are probably a bit hard to interpret from scratch, especially if the reader isn't familiar with the strudture of the data.
My first approach would be to identify sections of code that could be extracted into named methods that clarify the intent. Following that, I'd add some brief comments in areas where they'd be most helpful.

# Test Task: Implement Movie Ratings Feature

Objective: Develop and integrate a feature that allows users to rate movies within the application. This includes setting up the database schema, creating the necessary models and associations, developing an API for movie ratings, and providing a basic user interface for interaction.

## Requirements:

- Define the data layout to support movies and their ratings.
- Maintain clear and concise commit messages for version control.
- Define RESTful API for communication with UI part.
- The UI can be minimalistic but should be functional and user-friendly.

### API Development:

Develop RESTful API endpoints to:
- Create a new movie.
- Retrieve a list of movies.
- Submit a rating for a movie.
- Retrieve ratings for a specific movie.

### User Interface:

Implement a basic UI that allows users to:
- View a list of movies.
- Select a movie to view details and ratings.
- Submit a rating for a selected movie.

This task aims to assess your ability to design and implement a feature from the database layer to the user interface, including API development and documentation.

# Getting started 

## How can I fire up the app?
Good question! Make sure you install:
- Ruby ([rvm](https://rvm.io/rvm/install))
- Node ([nvm](https://github.com/nvm-sh/nvm#installing-and-updating))
- [Yarn](https://yarnpkg.com/lang/en/docs/install/#mac-stable)
- [Postgres](https://postgresapp.com/)

Then run:

`bin/setup`

Then start up the server with:

`bin/rails s`

Open a new tab in the terminal and run the webpack dev server:

`bin/webpack-dev-server`

Navigate to [http://localhost:3000](http://localhost:3000).

## Testing
### Make sure you run these tests before you commit.

Run the test-suite with:

`bin/rspec`

Run the Rubocop linter with:

`rubocop`

Run the Jest test-suite with:

`yarn jest --coverage`

Make sure you don't have any linting offenses with:

`yarn lint`

## Contributing

Let's say you want to implement issue #16 from GitHub, which is a feature about a Dropdown:

```
git checkout develop
git pull
git checkout -b issue/16-dropdown
... do work ...
git add -A
git commit -m 'Created the Dropdown component...'
git push -u origin head
```

- Go to GitHub and create the Pull Request.
- Use GitHub [keyword references](https://help.github.com/en/articles/closing-issues-using-keywords#about-issue-references) to link the pull request to the issue. For example, put the following into the pull request description: `Closes #16`.
- Assign the right person who needs to perform the next action (review and/or merge). If the reviewer has any requested changes, assign the issue back to the pull request author.

To find out more about the git workflow read the branching model which is linked in references below.

## Notable references
- [https://www.ruby-lang.org/en/documentation/quickstart/](https://www.ruby-lang.org/en/documentation/quickstart/)
- [https://edgeguides.rubyonrails.org](https://edgeguides.rubyonrails.org)
- [https://www.typescriptlang.org/docs/handbook/typescript-in-5-minutes.html](https://www.typescriptlang.org/docs/handbook/typescript-in-5-minutes.html)
- [https://reactjs.org/docs/getting-started.html](https://reactjs.org/docs/getting-started.html)
- [https://ant.design/](https://ant.design/)
- [https://webpack.js.org/guides/getting-started/](https://webpack.js.org/guides/getting-started/)
- [https://rspec.info](https://rspec.info)
- [https://jestjs.io/docs/en/getting-started](https://jestjs.io/docs/en/getting-started)
- [https://rubocop.readthedocs.io/en/latest/configuration/](https://rubocop.readthedocs.io/en/latest/configuration/)
- [https://github.com/varvet/pundit](https://github.com/varvet/pundit) (Authorization)
- Heroku (Hosting)
- ActiveStorage through S3 (Assets)
- [https://nvie.com/posts/a-successful-git-branching-model/](https://nvie.com/posts/a-successful-git-branching-model/)

## Troubleshooting
If you're stuck with this error while running the `bin/setup` command:

> error /business-platform/node_modules/node-sass: Command failed.

please check you node version:
`node --version`

and downgrade it to node@14:
```
brew unlink node
brew install node@14
brew link --overwrite node@14
```

If you're stuck with this error while running the `bin/setup` command:

> Redis::CannotConnectError: Error connecting to Redis on 127.0.0.1:6379 (Errno::ECONNREFUSED)

Open a new tab in the terminal and run the Redis server:

`redis-server`

import React from "react"
import PostsPage from "./PostsPage"
import PostPage from "./PostPage"
import { BrowserRouter as Router, Switch, Route, Link } from "react-router-dom"

export default function App() {
  return (
    <Router>
      <div>
        <nav>
          <ul>
            <li>
              <Link to="/">Home</Link>
            </li>
            <li>
              <Link to="/post/foo">Post</Link>
            </li>
          </ul>
        </nav>

        <Switch>
          <Route path="/post/:slug">
            <PostPage />
          </Route>
          <Route path="/">
            <PostsPage />
          </Route>
        </Switch>
      </div>
    </Router>
  )
}

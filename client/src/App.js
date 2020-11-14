import React from "react"
import PostsPage from "./PostsPage"
import PostPage from "./PostPage"
import { BrowserRouter as Router, Switch, Route, Link } from "react-router-dom"
import { QueryCache, ReactQueryCacheProvider } from "react-query"

const queryCache = new QueryCache()

export default function App() {
  return (
    <ReactQueryCacheProvider queryCache={queryCache}>
      <Router>
        <div>
          <nav>
            <ul>
              <li>
                <Link to="/">Home</Link>
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
    </ReactQueryCacheProvider>
  )
}

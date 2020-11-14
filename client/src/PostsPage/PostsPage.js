import React from "react"
import { Link } from "react-router-dom"

export default function PostsPage() {
  return (
    <div>
      <h2>Posts</h2>
      <Link to="/post/foo">Foo</Link>
    </div>
  )
}

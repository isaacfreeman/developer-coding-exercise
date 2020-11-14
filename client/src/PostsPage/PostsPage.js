import React from "react"
import { Link } from "react-router-dom"
import { useQuery } from "react-query"

async function fetchPosts() {
  const res = await fetch(
    "http://localhost:4000/posts"
  )
  return await res.json()
}

export default function PostsPage() {
  const { data, status, error } = useQuery("myQueryKey", fetchPosts)

  if (status === "loading") return "Loading..."

  if (error) return "An error has occurred: " + error.message

  return (
    <div>
      <h2>Posts</h2>
      <ul>
        {data.map((post, index) => {
          return (
            <React.Fragment key={index}>
              <li>
                <Link to={`/post/${post.slug}`}>
                  {post.title}
                </Link>
              </li>
            </React.Fragment>
          )
        })}
      </ul>
    </div>
  )
}

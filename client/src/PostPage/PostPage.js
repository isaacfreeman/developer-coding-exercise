import React from "react"
import { useParams } from "react-router-dom"
import { useQuery } from "react-query"
import parse from "html-react-parser"

async function fetchPost(key, { slug }) {
  const res = await fetch(`http://localhost:4000/posts/${slug}`)
  return await res.json()
}

export default function Post() {
  const { slug } = useParams()
  const { data, status, error } = useQuery(
    ["postQuery", { slug }],
    fetchPost
  )

  if (status === "loading") return "Loading..."

  if (error) return "An error has occurred: " + error.message

  return (
    <div>
      <h1>{data.title}</h1>
      <div>
        {parse(data.content)}
      </div>
    </div>
  )
}

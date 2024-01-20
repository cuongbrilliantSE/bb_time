import './SearchResult.css';
import Link from "next/link";

export const SearchResult = ({ result }) => {
  return <Link className="search-result" href={`/product/${result.attributes.slug}`}>
      {result.attributes.name}
  </Link>
}

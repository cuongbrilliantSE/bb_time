import './SearchResult.css';

export const SearchResult = ({ result }) => {
  return <a className="search-result" href={`/product/${result.attributes.slug}`}>
      {result.attributes.name}
  </a>
}

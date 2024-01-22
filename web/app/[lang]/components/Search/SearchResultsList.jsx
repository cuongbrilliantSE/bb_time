import './SearchResultsList.css';
import {SearchResult} from "@/app/[lang]/components/Search/SearchResult";

export const SearchResultsList = (results) => {
    return (
        <div className="result-list">
            {results.results.map((result, id) => {
              return <SearchResult result={result} key={id} />
            })}
        </div>

    );

}

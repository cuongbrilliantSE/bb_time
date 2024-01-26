import './SearchResultsList.css';
import {SearchResult} from "@/app/[lang]/components/Search/SearchResult";

export const SearchResultsList = (results) => {
    if (!results || !results.results || !Array.isArray(results.results)) {
        return ;
    }

    return (
        <div className="result-list">
            {results.results.map((result, id) => {
              return <SearchResult result={result} key={id} />
            })}
        </div>

    );

}

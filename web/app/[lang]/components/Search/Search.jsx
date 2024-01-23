import SearchImg from "@assets/icons/search.svg";
import CloseImg from "@assets/icons/red_x.svg";
import { Fragment } from "react";
import React, { useState } from 'react';
import {SearchBar} from "@/app/[lang]/components/Search/SearchBar";
import {SearchResultsList} from "@/app/[lang]/components/Search/SearchResultsList";

import SearchSpace from "./SearchSpace";

const Search = () => {
    const [isOpen, setIsOpen] = useState(false);

    const searchImgSrc = isOpen ? CloseImg.src : SearchImg.src;
    const togglePopup = () => {
        setIsOpen(!isOpen);
    }
    const [results, setResults] = useState([]);

  return (
    <Fragment>
      <div className="header-search">
        <img src={searchImgSrc} alt="search" onClick={togglePopup} />
          {isOpen && <SearchSpace
              content={<>
                  <SearchBar setResults={setResults}/>
                  <SearchResultsList results={results}/>
              </>}
          />}

      </div>
    </Fragment>
  );
};

export default Search;

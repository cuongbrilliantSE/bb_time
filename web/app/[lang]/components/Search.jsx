import SearchImg from "@assets/icons/search.svg";
import { Fragment } from "react";
import React, { useState } from 'react';
import Popup from "./Popup";
import {SearchBar} from "@/app/[lang]/components/SearchBar";
import {SearchResultsList} from "@/app/[lang]/components/SearchResultsList";

const Search = () => {
    const [isOpen, setIsOpen] = useState(false);

    const togglePopup = () => {
        setIsOpen(!isOpen);
    }
    const [results, setResults] = useState([]);

  return (
    <Fragment>
      <div className="header-search">
        <img src={SearchImg.src} alt="search" onClick={togglePopup} />
          {isOpen && <Popup
              content={<>
                  <SearchBar setResults={setResults}/>
                  <SearchResultsList results={results}/>
              </>}
              handleClose={togglePopup}
          />}

      </div>
    </Fragment>
  );
};

export default Search;

import SearchImg from "@assets/icons/search.svg";
import CloseImg from "@assets/icons/red_x.svg";
import { Fragment, useRef, useEffect } from "react";
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
    const [screenWidth, setScreenWidth] = useState(0);
    const searchRef = useRef(null);

    useEffect(() => {
        const handleOutsideClick = (event) => {
            if (searchRef.current && !searchRef.current.contains(event.target)) {
                // Click occurred outside the search component, close the search
                setIsOpen(false);
            }
        };

        // Add event listener to handle outside clicks
        document.addEventListener("mousedown", handleOutsideClick);

        // Clean up the event listener when the component unmounts
        return () => {
            document.removeEventListener("mousedown", handleOutsideClick);
        };
    }, []);


    useEffect(() => {
        const handleResize = () => {
            setScreenWidth(window.innerWidth);
        };

        handleResize();

        window.addEventListener('resize', handleResize);

        // Cleanup the event listener when the component is unmounted
        return () => {
            window.removeEventListener('resize', handleResize);
        };
    }, []);

  return (
    <Fragment>
      <div className="header-search" ref={searchRef}>
          {screenWidth >= 1024 && (
              <img src={searchImgSrc} alt="search" onClick={togglePopup} />
          )}
          {isOpen && screenWidth > 1024 && (
              <SearchSpace
                  content={<>
                          <SearchBar setResults={setResults} />
                          <SearchResultsList results={results} />
                      </>}
              />
          )}

          {screenWidth <= 1024 && (
              <>
                  <SearchBar setResults={setResults} />
                  <SearchResultsList results={results} />
              </>
          )}
      </div>
    </Fragment>
  );
};

export default Search;

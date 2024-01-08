import SearchImg from "@assets/icons/search.svg";
import { Fragment } from "react";

const Search = () => {
  return (
    <Fragment>
      <div className="header-search">
        <img src={SearchImg.src} alt="search" />
      </div>
    </Fragment>
  );
};

export default Search;

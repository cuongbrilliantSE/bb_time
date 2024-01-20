import SearchImg from "@assets/icons/search.svg";
import "./SearchBar.css"
import {useState} from "react";


export const SearchBar = ({ setResults }) => {
    const [input, setInput] = useState("");

    const fetchData = (value) => {
        fetch("https://jsonplaceholder.typicode.com/users")
            .then((response) => response.json())
            .then((json) => {
                const results = json.filter((user) => {
                   return {
                      result: value &&
                       user &&
                       user.name &&
                       user.name.toLowerCase().includes(value)
                   }
                });

                setResults(results);
            });
    }

    const handleChange = (value) => {
        setInput(value);
        fetchData(value)
    }


    return (
        <div className="input-wrapper">
            <img src={SearchImg.src} alt="search" />
            <input
                placeholder="Nhập tên sản phẩm..."
                value={input}
                onChange={(e) => {handleChange(e.target.value)}}
            />
        </div>
    );

}

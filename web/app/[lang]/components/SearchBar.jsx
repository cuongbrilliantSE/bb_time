import SearchImg from "@assets/icons/search.svg";
import "./SearchBar.css"
import {useState} from "react";


export const SearchBar = ({ setResults }) => {
    const [input, setInput] = useState("");

    const fetchData = (value) => {
        const apiUrl = `${process.env.NEXT_PUBLIC_BASE_URL}/api/products`;
        const queryParams = {
            locale: 'vi-VN',
            _q: value
        };

        const queryString = new URLSearchParams(queryParams).toString();
        const fullUrl = `${apiUrl}?${queryString}`;

        return fetch(fullUrl, {
            cache: "no-store",
        }).then((res) => res.json())
        .then((json) => {
            setResults(json.data);
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

"use client";
import './index.scss';
import clsx from "clsx";
import {useEffect, useState} from "react";

export const ProductCategory = (props) => {
  const listCategory = props.listCategory.map(item => item.attributes.title);
  const scrollTo = (id) => {
    const element = document.getElementById(id);
    const topY = element.offsetTop;
    window.scroll({
      top: topY - 160,
      behavior: "smooth"
    });
  }
  const [fixCategory, setFixCategory] = useState(false);
  const [categoryActive, setCategoryActive] = useState(null);

  const toggleVisible = () => {
    if (document.documentElement.scrollTop > 380) {
      setFixCategory(true);
    } else {
      setFixCategory(false);
    }
  };

  useEffect(() => {
    window.addEventListener("scroll", toggleVisible);
    return () => window.removeEventListener("scroll", toggleVisible);
  }, []);

  return (
    <div className={clsx('container-category-product', {'fixed-category': fixCategory})}>
      <div className="list-content">
        {
          listCategory.map((item, index) => (
            <span
              className={clsx('pointer', {'category-active': index === categoryActive})}
              key={`product-category-${index}`}
              onClick={() => {
                scrollTo(`category-product-${index}`);
                setCategoryActive(index);
              }}>
              {item}
            </span>
          ))
        }
      </div>
    </div>
  )
}

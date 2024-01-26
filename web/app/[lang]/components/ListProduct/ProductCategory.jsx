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
      top: topY - 180,
      behavior: "smooth"
    });
  }
  const [fixCategory, setFixCategory] = useState(false);
  const [activeCategory, setActiveCategory] = useState(null);

  const toggleVisible = () => {
    if (document.documentElement.scrollTop > 380) {
      setFixCategory(true);
    } else {
      setFixCategory(false);
    }
  };

  useEffect(() => {
    window.addEventListener("scroll", toggleVisible, {passive: true});
    return () => window.removeEventListener("scroll", toggleVisible);
  }, []);

  useEffect(() => {
    const handleScroll = () => {
      const scrollPosition = (window.scrollY || document.documentElement.scrollTop) + 200;

      const categoryElements = document.querySelectorAll('.category');
      const categoryPositions = Array.from(categoryElements).map((el) => ({
        id: el.id,
        offsetTop: el.offsetTop,
        offsetHeight: el.offsetHeight,
      }));

      let foundCategory = null;
      for (const category of categoryPositions) {
        if (
          scrollPosition >= category.offsetTop &&
          scrollPosition < category.offsetTop + category.offsetHeight
        ) {
          foundCategory = category.id;
          break;
        }
      }

      setActiveCategory(foundCategory);
    };

    // Thêm sự kiện cuộn
    window.addEventListener('scroll', handleScroll);

    return () => {
      window.removeEventListener('scroll', handleScroll);
    };
  }, []);
  return (
    <div className={clsx('container-category-product', {'fixed-category': fixCategory})}>
      <div className="list-content">
        {
          listCategory.map((item, index) => (
            <span
              className={clsx('pointer',
                {'category-active': `category-product-${index}` === activeCategory}
              )}
              key={`product-category-${index}`}
              onClick={() => {
                scrollTo(`category-product-${index}`);
                setActiveCategory(`category-product-${index}`);
              }}>
              {item}
            </span>
          ))
        }
      </div>
    </div>
  )
}

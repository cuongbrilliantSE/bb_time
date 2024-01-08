"use client";

import { getImgUrl } from "@/app/lib";
import ChevronUpImg from "@assets/icons/chevron_up_small.svg";
import MenuIcon from "@assets/icons/menu.svg";
import LogoImg from "@assets/logo/logo_1.svg";
import clsx from "clsx";
import Image from "next/image";
import Link from "next/link";
import { useState } from "react";
import ChangeLanguage from "./ChangeLanguage";
import Search from "./Search";

const Header = ({ i18n, categories }) => {
  const [open, setOpen] = useState(false);
  const [menuLv1Open, setMenuLv1Open] = useState();

  const navData = [
    {
      title: i18n.products,
      url: "/product",
      child: categories.map((i) => ({
        title: i.attributes.title,
        child: i.attributes.products.data.map((prd) => ({
          title: prd.attributes.full_name,
          url: `/product/${prd.attributes.slug}`,
          icon: getImgUrl(prd.attributes.thumb.data.attributes.url),
        })),
      })),
    },
    {
      title: i18n.services,
      url: "/service",
    },
    {
      title: i18n.news,
      url: "/news",
    },
    {
      title: i18n.introduce,
      url: "/introduce",
    },
    {
      title: i18n.contact,
      url: "/contact",
    },
  ];

  return (
    <header>
      <div className="container">
        <div className="nav-menu-btn" onClick={() => setOpen(!open)}>
          <Image src={MenuIcon.src} alt="menu" width={24} height={24} />
        </div>
        <nav className={clsx("nav", { "nav-open": open })}>
          <div className="nav-brand-wp">
            <Link href="/" className="nav-brand">
              <img src={LogoImg.src} alt="logo" />
            </Link>
          </div>

          <div className="nav-inner">
            <div className="nav-list-wp">
              <ul className="nav-list">
                {navData.map((i, idx) => (
                  <li
                    key={idx}
                    className={clsx("nav-item", {
                      "nav-item-open": menuLv1Open == i.title,
                    })}
                  >
                    <div className="nav-link">
                      <Link
                        onClick={(e) => {
                          setOpen(false);
                          setMenuLv1Open(undefined);
                        }}
                        href={i.url || "#"}
                      >
                        {i.title}{" "}
                      </Link>
                      {!!i?.child?.length && (
                        <div
                          className="nav-item-arrow"
                          onClick={() => {
                            setMenuLv1Open(!!menuLv1Open ? undefined : i.title);
                          }}
                        >
                          <img src={ChevronUpImg.src} alt="chevron-up" />
                        </div>
                      )}
                    </div>

                    {!!i?.child?.length && (
                      <ul className={clsx("nav-list-2")}>
                        {i.child.map((lv2, idx2) => (
                          <li className="nav-item-2" key={idx2}>
                            <div className="nav-link-2">
                              {lv2?.url ? (
                                <Link
                                  onClick={(e) => {
                                    setOpen(false);
                                    setMenuLv1Open(undefined);
                                  }}
                                  href={lv2.url}
                                >
                                  {lv2.title}
                                </Link>
                              ) : (
                                lv2.title
                              )}
                              {!!lv2?.child?.length && (
                                <img src={ChevronUpImg.src} alt="chevron-up" />
                              )}
                            </div>
                            {!!lv2?.child?.length && (
                              <ul className="nav-list-3">
                                {lv2.child.map((lv3, idx3) => (
                                  <li key={idx3} className="nav-item-3">
                                    <Link
                                      onClick={(e) => {
                                        setOpen(false);
                                        setMenuLv1Open(undefined);
                                      }}
                                      href={lv3.url || "#"}
                                      className="nav-link-3"
                                    >
                                      <img src={lv3.icon} />
                                      {lv3.title}
                                    </Link>
                                  </li>
                                ))}
                              </ul>
                            )}
                          </li>
                        ))}
                      </ul>
                    )}
                  </li>
                ))}
              </ul>
              <Search />
            </div>

            <ChangeLanguage />
          </div>
        </nav>
      </div>
    </header>
  );
};

export default Header;

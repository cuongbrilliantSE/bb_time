import styles from "./page.module.scss";
import { getDictionary } from "../../../../../get-dictionary";
import { getDataFromFetch } from "@lib/index";
import ImageResponsive from "@/app/components/ImageResponsive";
import BreadCrumb from "@components/Breadcrumb";
import { Fragment } from "react";
import { notFound } from "next/navigation";
import Tab from "./Tab";
import clsx from "clsx";
import Gallery from "./gallery";
import TabMobile from "./tab-mobile/index";
import TabDesktop from "./tab-desktop/index";
import GalleryTab from "./gallery-tab";
import VideoList from "./videos";
import PostRelated from "@components/post-relate";
import Connect from "@components/connect";

export default async function DetailProduct({ params }) {
  const dictionary = await getDictionary(params.lang);

  const [detailPrd] = await getDataFromFetch([
    {
      object: `products`,
      query: {
        populate: {
          banner: "*",
          galleries: {
            populate: "*",
          },
          product_specifications: "*",
          product_documents: "*",
          guides: "*",
          galleries2: {
            populate: "*",
          },
          videos: {
            populate: "*",
          },
          posts: {
            populate: "*",
          },
        },
        filters: {
          slug: {
            $eq: params.slug,
          },
        },
      },
    },
  ]);

  //   console.log(detailPrd.meta.total);
  if (detailPrd.meta.pagination.total != 1) {
    notFound();
  }
  const product = detailPrd.data[0].attributes;
  //   console.log(JSON.stringify(product));
  return (
    <Fragment>
      <ImageResponsive
        className="max-width-container"
        data={product?.banner?.data?.attributes} />
      <Tab i18n={dictionary.product} />
      <section
        style={{ scrollMarginTop: "150px" }}
        id="info"
        className={clsx("container", styles.infoWp)}
      >
        <div className={styles.gallery}>
          <Gallery data={product.galleries} />
        </div>
        <div>
          <p className={clsx(styles.in4Fullname, "animation")}>
            {product.full_name}
          </p>
          <p className={clsx(styles.in4ShortName, "animation")}>
            {product.short_name}
          </p>
          <p className={clsx(styles.in4Model, "animation")}>
            <span>{dictionary.product.model}:</span> {product.model}
          </p>
          <div
            className={clsx("divider", "animation")}
            style={{ margin: "10px 0" }}
          ></div>
          <p className={clsx(styles.in4Model, "animation")}>
            <span>{dictionary.product.manufacturer}:</span>{" "}
            {product.manufacturer}
          </p>
          <div
            className={clsx("divider", "animation")}
            style={{ margin: "10px 0" }}
          ></div>
          <p className={clsx(styles.in4Model, "animation")}>
            <span>{dictionary.product.origin}:</span> {product.origin}
          </p>
          <div
            className={clsx("divider", "animation")}
            style={{ margin: "10px 0" }}
          ></div>
          <p className={clsx(styles.in4Model, "animation")}>
            <span>{dictionary.product.des}:</span>
          </p>
          <p className={clsx(styles.in4Des, "animation")}>
            {product.description}
          </p>
        </div>
      </section>
      <section id="specification" style={{ scrollMarginTop: "200px" }}>
        <TabMobile product={product} i18n={dictionary.product} />
        <TabDesktop product={product} i18n={dictionary.product} />
      </section>
      <GalleryTab product={product} i18n={dictionary.product} />
      <VideoList product={product} i18n={dictionary.product} />

      <section className={"container"}>
        <PostRelated product={product} i18n={dictionary.product} />
      </section>

      <Connect i18n={dictionary.connect} />
    </Fragment>
  );
}

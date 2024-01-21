import ImageResponsive from "@/app/components/ImageResponsive";
import BgImg from "@assets/bg/bg_product.svg";
import BreadCrumb from "@components/Breadcrumb";
import ChevronRightImg from "@components/ChevronRight";
import { getDataFromFetch } from "@lib/index";
import clsx from "clsx";
import Link from "next/link";
import { getDictionary } from "../../../../get-dictionary";
import styles from "./page.module.scss";

export default async function Home({ params }) {
  const dictionary = await getDictionary(params.lang);

  const [productPage, categories] = await getDataFromFetch([
    {
      object: "product-page",
      query: {
        populate: {
          banner: "*",
        },
      },
    },
    {
      object: "categories",
      query: {
        populate: {
          products: {
            fields: ["full_name", "description", "slug"],
            populate: {
              thumb: "*",
            },
          },
        },
      },
    },
  ]);

  return (
    <main>
      <section className={clsx(styles.banner)}>
        <ImageResponsive
          data={productPage?.data?.attributes?.banner?.data?.attributes}
        />
      </section>
      <section>
        <div className="container">
          <div className={clsx(styles.productBreadcrumb, "animation")}>
            <BreadCrumb
              data={[
                { title: dictionary.nav.home, url: "/" },
                { title: dictionary.nav.products },
              ]}
            />
          </div>
          <p className={clsx(styles.txt1, "animation")}>
            {dictionary.product.product}
          </p>
          <p className={clsx(styles.txt2, "animation")}>
            {dictionary.product.ours}
          </p>
          <p className={clsx(styles.pageDes, "animation")}>
            {productPage?.data?.attributes?.description}
          </p>
        </div>
      </section>
      <section className={clsx("container", styles.secPrd)}>
        {categories.data.map((cat) => (
          <div key={cat.id}>
            <p
              className={clsx(styles.catTitle, "animation")}
              data-animation="fade-in-up"
            >
              {cat.attributes.title}
            </p>
            <div className={styles.products}>
              {cat.attributes.products.data.map((prd, idx) => (
                <div
                  className={clsx(styles.prdWp, {
                    [styles.prdWithBorder]:
                      Math.ceil(cat.attributes.products.data.length / 2) * 2 -
                        2 >
                      idx,
                  })}
                  key={prd.id}
                >
                  <div
                    className={clsx(styles.prdImg, "animation")}
                    data-animation="fade-in-up"
                  >
                    <img src={BgImg.src} />
                    <ImageResponsive
                      className={styles.prdImg2}
                      data={prd.attributes.thumb.data.attributes}
                    />
                  </div>
                  <div className={styles.prdIn4}>
                    <p
                      className={clsx(styles.prdTitle, "animation")}
                      data-animation="fade-in-up"
                    >
                      {prd.attributes.full_name}
                    </p>
                    <p
                      className={clsx(styles.prdDes, "animation")}
                      data-animation="fade-in-up"
                    >
                      {prd?.attributes?.description ||
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do"}
                    </p>
                    <Link
                      href={`/product/${prd.attributes.slug}`}
                      className={clsx(styles.detailBtn, "animation")}
                      data-animation="fade-in-up"
                    >
                      <p>{dictionary.home.view_detail}</p>
                      <ChevronRightImg />
                    </Link>
                  </div>
                </div>
              ))}
            </div>
          </div>
        ))}
      </section>
      <div className={styles.divider}></div>
    </main>
  );
}

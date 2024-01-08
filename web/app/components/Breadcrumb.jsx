import Link from "next/link";
import { Fragment } from "react";

const Breadcrumb = ({ data }) => {
  return (
    <div style={{ display: "inline-block" }}>
      {data.map((i, idx) => (
        <Fragment key={idx}>
          {i?.url ? (
            <Link
              style={{
                color: "var(--text-gray-2)",
                fontSize: 16,
                padding: "0 5px",
              }}
              href={i.url}
            >
              {i.title}
            </Link>
          ) : (
            <div
              style={{
                padding: "0 5px",
                display: "inline-block",
                color:
                  idx == data.length - 1
                    ? "var(--blue-4)"
                    : "var(--text-gray-2)",
                fontSize: 16,
              }}
            >
              {i.title}
            </div>
          )}
          {idx != data.length - 1 && (
            <span style={{ color: "var(--text-gray-2)" }}>&gt;</span>
          )}
        </Fragment>
      ))}
    </div>
  );
};

export default Breadcrumb;

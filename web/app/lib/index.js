import qs from "qs";

export const getImgUrl = (url) => `${process.env.NEXT_PUBLIC_BASE_URL}${url}`;

export const getDataFromFetch = async (queries) => {
  const _promise = Promise.all(
    queries.map((i) => {
      const _query = qs.stringify(i.query, { encodeValuesOnly: true });
      return fetch(`${process.env.BASE_URL}/api/${i.object}?${_query}`, {
        // cache:
        //   process.env.NODE_ENV == "production" ? "force-cache" : "no-store",
        cache: "no-store",
      }).then((res) => res.json());
    })
  );
  const res = await _promise;
  return res;
};

export const pushDataToObject = async (object, body) => {
    try {

        const res = await fetch(`${process.env.NEXT_PUBLIC_BASE_URL}/api/${object}`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            cache: "no-store",
            body: JSON.stringify(body),
        });

        if (!res.ok) {
            throw new Error('Failed to push data to object');
        }

        return res.json();
    } catch (error) {
        console.error('Error:', error);
        throw error;
    }
};

export const formatPrefixNumber = (x, numberDigit = 2) => {
  const _digit = String(x).length;
  const _remain = numberDigit - _digit;
  if (_remain > 0) {
    return "0".repeat(_remain) + x;
  } else {
    return x;
  }
};

export const formatNumber = (x) => {
  if (x < 1000) {
    return x;
  } else if (x < 1000000) {
    return Math.round(x / 1000) + "K";
  } else {
    return Math.round(x / 1000000) + "M";
  }
};

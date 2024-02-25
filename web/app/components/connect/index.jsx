"use client"
import styles from "./style.module.scss";
import DividerImg from "@assets/icons/divider_gradient.svg";
import {useState} from "react";
import {pushDataToObject} from "@lib/index";
import {toast} from "react-toastify";

const Connect = ({ i18n }) => {
  // Define state to hold the input value
  const [contact, setContact] = useState('');

  // Event handler to update the email state when input changes
  const handleInputChange = (e) => {
    setContact(e.target.value);
  };

  // Event handler to handle form submission (if needed)
  const handleSubmit = async (e) => {
    e.preventDefault();
    // Handle form submission, you can use the email state here

    if (contact.length === 0) {
      toast.info(i18n.pls_type_info)
      return;
    }

    const res = await pushDataToObject('customers', {
      data: {contact}
    });

    if (res && res.data) {
      toast.success(i18n.successfully_send);
      setContact('');
    }

  };

  return (
      <section className="container">
        <div className={styles.wp}>
          <div className={styles.txt}>
            <p>{i18n.connect}</p>
            <img src={DividerImg.src} />
          </div>
          <div className={styles.input}>
            {/* Input field with event handler */}
            <input
                type="text"
                placeholder={i18n.email_placeholder}
                value={contact} // Set input value to the email state
                onChange={handleInputChange} // Call handleInputChange on change
            />
          </div>
          <div className={styles.btn}>
            {/* Submit button (if needed) */}
            <button style={{ cursor: 'pointer' }} onClick={handleSubmit}>{i18n.send_info}</button>
          </div>
        </div>
      </section>
  );
};




export default Connect;

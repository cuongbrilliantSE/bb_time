"use client";
import React, { useState } from 'react';
import clsx from "clsx";
import styles from "../page.module.scss";
import {toast} from "react-toastify";
import {pushDataToObject} from "@/app/lib";

function ContactForm({ dictionary }) {
    const [formData, setFormData] = useState({
        name: '',
        email: '',
        phone_number: '',
        content: ''
    });


    const handleChange = (e) => {
        setFormData({
            ...formData,
            [e.target.name]: e.target.value
        });
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        try {
            const res = await pushDataToObject('customers', {
                data: {...formData}
            });

            if (res && res.data) {
                toast.success(dictionary.connect.successfully_send);
                setFormData({
                    name: '',
                    email: '',
                    phone_number: '',
                    content: ''
                });
            }
        } catch (error) {
            console.error('Error submitting form:', error);
            toast.error(dictionary.connect.error_send);
        }
    };

    return (
        <form onSubmit={handleSubmit} className={styles.formWp}>
            <div className={clsx(styles.itemShort, "animation")}>
                <input
                    className={styles.input}
                    placeholder={dictionary.contact.name}
                    name="name"
                    value={formData.name}
                    onChange={handleChange}
                />
            </div>
            <div className={clsx(styles.itemShort, "animation")}>
                <input
                    className={styles.input}
                    placeholder={dictionary.contact.email}
                    name="email"
                    value={formData.email}
                    onChange={handleChange}
                />
            </div>
            <div className={clsx(styles.itemLong, "animation")}>
                <input
                    className={styles.input}
                    placeholder={dictionary.contact.phone_number}
                    type="number"
                    name="phone_number"
                    value={formData.phone_number}
                    onChange={handleChange}
                />
            </div>
            <div className={clsx(styles.itemLong, "animation")}>
              <textarea
                  className={styles.input}
                  placeholder={dictionary.contact.content}
                  name="content"
                  value={formData.content}
                  onChange={handleChange}
                  rows="4"
              />
            </div>
            <div className="animation">
                <button className={styles.btn}>{dictionary.contact.send}</button>
            </div>
        </form>
    );
}

export default ContactForm;

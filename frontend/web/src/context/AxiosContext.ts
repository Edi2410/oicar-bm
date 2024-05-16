import Axios, { AxiosInstance } from "axios";
import { createContext, createElement, useMemo } from "react";
import { useNavigate } from "react-router-dom";
export const AxiosContext = createContext<AxiosInstance>(Axios);

export const AxiosProvider = ({
  children,
}: React.PropsWithChildren<unknown>) => {
  const navigate = useNavigate();
  const auth = useMemo(() => {
    //const axios = Axios.create({ baseURL: "https://bm.estudent.hr/api/" });
    //const axios = Axios.create({ baseURL: "http://127.0.0.1:8000/api/" });
    const axios = Axios.create({ baseURL: "http://127.0.0.1:8701/api/" });
    const tokenData: string | null = sessionStorage.getItem("accessToken");

    axios.interceptors.request.use((config) => {
      if (tokenData) {
        config.headers.Authorization = `Bearer ${tokenData}`;
      }
      return config;
    });

    axios.interceptors.response.use(
      (response) => {
        return response;
      },

      (error) => {
        if (error.response?.status === 401) {
          sessionStorage.removeItem("accessToken");
          if (window.location.pathname !== "/") {
            window.location.reload();
          }
        }
        return Promise.reject(error);
      }
    );
    return axios;
  }, [navigate]);

  return createElement(AxiosContext.Provider, { value: auth }, children);
};

import ReactDOM from "react-dom/client";
import App from "./App.tsx";
import "./index.css";
import { ConfigProvider } from "antd";

import hr_HR from "antd/locale/hr_HR";
import { QueryClient, QueryClientProvider } from "react-query";
import { AxiosProvider } from "./context/AxiosContext.ts";
import { BrowserRouter } from "react-router-dom";
import { UserContextProvider } from "./context/UserContext";

const queryClient = new QueryClient();

ReactDOM.createRoot(document.getElementById("root")!).render(
  <ConfigProvider
    theme={{
      token: {
        colorPrimary: "#861949",
      },
    }}
    locale={hr_HR}
  >
    <BrowserRouter>
      <QueryClientProvider client={queryClient}>
        <UserContextProvider>
          <AxiosProvider>
            <App />
          </AxiosProvider>
        </UserContextProvider>
      </QueryClientProvider>
    </BrowserRouter>
  </ConfigProvider>
);

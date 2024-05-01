import { DriveEmbedding } from "@components";
import { Spin } from "antd";
import { Suspense } from "react";

export const CvPage = () => {
  return (
    <div className="pageSize">
      <Suspense fallback={<Spin />}>
        <DriveEmbedding />
      </Suspense>
    </div>
  );
};

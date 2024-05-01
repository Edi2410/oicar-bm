import { CommentsAndGrades } from "@components";
import { Spin } from "antd";
import { Suspense } from "react";

export const CommentsAndGradesPage = () => {
  return (
    <div className="pageSize">
      <Suspense fallback={<Spin />}>
        <CommentsAndGrades />
      </Suspense>
    </div>
  );
};

import { Flex } from "antd";
import { useUserContext } from "../../hooks/useUserContext";
import { FolderData } from "../../types/user-types";
import "./DriveEmbeddingStyle.css";

const DriveEmbedding = () => {
  const { user } = useUserContext();
  if (user?.is_student) {
    return <div>Not authorized</div>;
  }
  if (!user?.folder_id === undefined || user?.folder_id?.length === 0) {
    return <div>Obratite se na it.podrska@estudent.hr</div>;
  }

  return (
    <Flex vertical justify="center" align="center">
      {user?.folder_id?.map((folder: FolderData) => (
        <details key={folder?.id}>
          <summary>{folder?.folder_name}</summary>
          <iframe
            title={`iframe-${folder.id}`}
            src={`https://drive.google.com/embeddedfolderview?id=${folder.drive_link}#list`}
          />
        </details>
      ))}
    </Flex>
  );
};
export default DriveEmbedding;

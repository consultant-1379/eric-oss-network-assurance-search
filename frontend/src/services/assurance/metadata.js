import MetadataApi from '../../api/MetadataApi';

const metadataApi = new MetadataApi();

export const getIndices = () => metadataApi.getAvailableIndexes();
export const getContextInformationForIndex = (index) => metadataApi.getStaticInformation(index);

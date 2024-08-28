import SystemApi from '../../api/SystemApi';

const systemApi = new SystemApi();

export const getSystemState = () => systemApi.getSystemState();

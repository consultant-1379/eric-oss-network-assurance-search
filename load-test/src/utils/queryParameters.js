const metadataRelationsQueryParameters = [
  {
    contextTypeId: 'nf',
  },
  {
    contextTypeId: 'snssai',
  },
  {
    contextTypeId: 'nf_snssai',
  },
];

const metadataMetricsQueryParameters = [
  {
    contextTypeId: 'nf',
  },
  {
    contextTypeId: 'snssai',
  },
  {
    contextTypeId: 'nf_snssai',
  },
];

const searchMetricsQueryParameters = [
  {
    contextTypeId: 'tac',
    metricTypes: [
      {
        id: 'vd_tac_PartialDRBAccessibility',
      },
    ],
    sortBy: {
      id: 'vd_tac_PartialDRBAccessibility',
    },
    sortOrder: 'desc',
    offset: '0',
    length: '1',
  },
  {
    contextTypeId: 'tac',
    metricTypes: [
      {
        id: 'vd_tac_PartialDRBAccessibility',
      },
    ],
    filters: [
      {
        type: 'metric',
        metricType: {
          id: 'vd_tac_PartialDRBAccessibility',
        },
        from: 2,
        to: 60.78,
      },
      {
        type: 'entity',
        entityType: { id: 'c_tac' },
        searchPattern: '1*',
      },
    ],
    sortBy: {
      id: 'vd_tac_PartialDRBAccessibility',
    },
    sortOrder: 'desc',
    offset: '0',
    length: '1',
  },
  {
    contextTypeId: 'tac',
    metricTypes: [
      {
        id: 'vd_tac_PartialDRBAccessibility',
      },
      {
        id: 'vd_tac_DLLat_gNB-DU',
      },
      {
        id: 'vd_tac_DLDelay_gNBDU',
      },
      {
        id: 'vd_tac_DLUeThroughput',
      },
      {
        id: 'vd_tac_UlUeThroughput',
      },
      {
        id: 'vd_tac_GRANGOSR',
      },
      {
        id: 'vd_tac_5GSEPHOSR',
      },
    ],
    filters: [
      {
        type: 'metric',
        metricType: {
          id: 'vd_tac_PartialDRBAccessibility',
        },
        from: 2,
        to: 60.78,
      },
    ],
    sortBy: {
      id: 'vd_tac_PartialDRBAccessibility',
    },
    sortOrder: 'asc',
    offset: '0',
    length: '1',
  },
];

const searchContextsQueryParameters = [
  {
    filters: [
      {
        type: 'entity',
        entityType: { id: 'c_snssai' },
        searchPattern: '1-100*',
      },
    ],
    contextTypeId: 'snssai',
    sortBy: { id: 'vi_snssai_AMFMeanRegNbr' },
    sortOrder: 'desc',
    offset: '1',
    length: '5',
  },
  {
    filters: [
      {
        type: 'entity',
        entityType: { id: 'c_plmnId' },
        searchPattern: '302-*',
      },
    ],
    contextTypeId: 'cellId_managedElement_nssi_plmnId_qos_snssai_tac',
    sortBy: { id: 'vi_cellId_managedElement_nssi_plmnId_qos_snssai_tac_AMFMeanRegNbr' },
    sortOrder: 'desc',
    offset: 1,
    length: 2,
  },
];

const searchRelatedContextsFacetsQueryParameters = [
  {
    contextTypeId: 'nf_snssai',
    contextId: {
      type: {
        id: 'nf_snssai',
        contextFields: [{ id: 'c_nf' }, { id: 'c_snssai' }],
      },
      contextFields: [
        {
          id: 'AMF_ON2',
          type: {
            id: 'c_nf',
          },
        },
        {
          id: '1-1002',
          type: {
            id: 'c_snssai',
          },
        },
      ],
    },
  },
  {
    contextTypeId: 'cellId_managedElement_tac',
    contextId: {
      type: {
        id: 'cellId_managedElement_tac',
        contextFields: [{ id: 'c_cellId' }, { id: 'c_managedElement' }, { id: 'c_tac' }],
      },
      contextFields: [
        {
          id: 'AMF_ON2',
          type: {
            id: '334',
          },
        },
        {
          id: 'me-2-id',
          type: {
            id: 'c_managedElement',
          },
        },
        {
          id: '807',
          type: {
            id: 'c_tac',
          },
        },
      ],
    },
  },
];

export {
  metadataRelationsQueryParameters,
  metadataMetricsQueryParameters,
  searchMetricsQueryParameters,
  searchContextsQueryParameters,
  searchRelatedContextsFacetsQueryParameters,
};

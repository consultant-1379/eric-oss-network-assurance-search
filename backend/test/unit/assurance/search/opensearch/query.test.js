import { expect } from 'chai';
import {
  buildSearchMetricsQ1Query,
  buildSearchMetricsQ2Query,
  buildSearchRelatedContextsFacetsQuery,
  buildSearchContextsQuery,
} from '../../../../../services/assurance/search/opensearch/query.js';

const indexName = 'soa';
const fullContext = 'NF_SNSSAI';
const metricId = 'vi_NF_SNSSAI_AMFMeanRegNbr';

describe('Unit tests for query.js', () => {
  describe('Scenario 1 with a contextTypeId and a metric - unsanitized', () => {
    const unSanitizedQuery = {
      contextTypeId: 'NF_SNSSAI',
      metricTypes: [{ id: 'vi_NF_SNSSAI_AMFMeanRegNbr' }],
      sortBy: undefined,
    };
    const resQ1 = {
      body: {
        from: undefined,
        query: {
          bool: {
            filter: {
              bool: {
                must: [
                  {
                    range: {
                      vi_NF_SNSSAI_AMFMeanRegNbr: {
                        gte: 0,
                      },
                    },
                  },
                ],
              },
            },
            must: [
              {
                match: {
                  full_context: 'NF_SNSSAI',
                },
              },
            ],
          },
        },
        size: undefined,
        sort: [
          {
            vi_NF_SNSSAI_AMFMeanRegNbr: {
              order: undefined,
              unmapped_type: 'long',
            },
          },
        ],
      },
      index: 'soa',
    };

    it('should return a proper first query', () => {
      expect(buildSearchMetricsQ1Query(indexName, unSanitizedQuery)).to.deep.equals(resQ1);
    });

    const resQ2 = {
      body: {
        from: 0,
        query: {
          bool: {
            filter: {
              bool: {
                minimum_should_match: 1,
                should: [
                  {
                    range: {
                      vi_NF_SNSSAI_AMFMeanRegNbr: {
                        gte: 0,
                      },
                    },
                  },
                ],
              },
            },
            minimum_should_match: 0,
            must: [
              {
                match: {
                  full_context: 'NF_SNSSAI',
                },
              },
            ],
            should: [],
          },
        },
        size: 1000,
      },
      index: 'soa',
    };

    it('should return proper second query - with filter - gte', () => {
      expect(buildSearchMetricsQ2Query(indexName, unSanitizedQuery, resQ1.body)).to.deep.equals(
        resQ2,
      );
    });
  });

  describe('Scenario 2 with a contextTypeId and metrics - sanitized', () => {
    const sanitizedQuery = {
      contextTypeId: 'NF_SNSSAI',
      metricTypes: [{ id: 'vi_NF_SNSSAI_AMFMeanRegNbr' }],
      sortOrder: 'asc',
      offset: 0,
      length: 10,
    };
    let filterBody;
    const resQ1 = {
      body: {
        from: 0,
        query: {
          bool: {
            must: [
              {
                match: {
                  full_context: 'NF_SNSSAI',
                },
              },
            ],
          },
        },
        size: 10,
        sort: [
          {
            vi_NF_SNSSAI_AMFMeanRegNbr: {
              order: 'asc',
              unmapped_type: 'long',
            },
          },
        ],
      },
      index: 'soa',
    };

    it('should return a proper first query - with filter - gte', () => {
      sanitizedQuery.filters = [
        {
          name: 'vi_NF_SNSSAI_AMFMeanRegNbr',
          type: 'metric',
          metricType: { id: 'vi_NF_SNSSAI_AMFMeanRegNbr' },
          from: 10,
        },
      ];
      filterBody = {
        bool: {
          minimum_should_match: 1,
          must: [
            {
              range: {
                vi_NF_SNSSAI_AMFMeanRegNbr: {
                  gte: 0,
                },
              },
            },
          ],
          should: [
            {
              range: {
                vi_NF_SNSSAI_AMFMeanRegNbr: {
                  gte: 10,
                },
              },
            },
          ],
        },
      };
      resQ1.body.query.bool.filter = filterBody;
      expect(buildSearchMetricsQ1Query(indexName, sanitizedQuery)).to.deep.equals(resQ1);
    });

    const resQ2 = {
      body: {
        from: 0,
        query: {
          bool: {
            filter: {
              bool: {
                minimum_should_match: 1,
                should: [
                  {
                    range: {
                      vi_NF_SNSSAI_AMFMeanRegNbr: {
                        gte: 10,
                      },
                    },
                  },
                ],
              },
            },
            minimum_should_match: 0,
            must: [
              {
                match: {
                  full_context: 'NF_SNSSAI',
                },
              },
            ],
            should: [],
          },
        },
        size: 1000,
      },
      index: 'soa',
    };

    it('should return proper second query', () => {
      expect(buildSearchMetricsQ2Query(indexName, sanitizedQuery, resQ1.body)).to.deep.equals(
        resQ2,
      );
    });

    it('should return a proper first query - with filter - equal to', () => {
      sanitizedQuery.filters = [
        {
          name: 'vi_NF_SNSSAI_AMFMeanRegNbr',
          type: 'metric',
          metricType: { id: 'vi_NF_SNSSAI_AMFMeanRegNbr' },
          from: 10,
          to: 10,
        },
      ];
      filterBody = {
        bool: {
          must: [
            {
              range: {
                vi_NF_SNSSAI_AMFMeanRegNbr: {
                  gte: 0,
                },
              },
            },
            {
              match: {
                vi_NF_SNSSAI_AMFMeanRegNbr: 10,
              },
            },
          ],
        },
      };
      resQ1.body.query.bool.filter = filterBody;
      expect(buildSearchMetricsQ1Query(indexName, sanitizedQuery)).to.deep.equals(resQ1);
    });

    it('should return a proper first query - with filter - not equal to', () => {
      sanitizedQuery.filters = [
        {
          name: 'vi_NF_SNSSAI_AMFMeanRegNbr',
          type: 'metric',
          metricType: { id: 'vi_NF_SNSSAI_AMFMeanRegNbr' },
          from: 10,
          to: 10,
          not: true,
        },
      ];
      filterBody = {
        bool: {
          must: [
            {
              range: {
                vi_NF_SNSSAI_AMFMeanRegNbr: {
                  gte: 0,
                },
              },
            },
          ],
          must_not: [
            {
              match: {
                vi_NF_SNSSAI_AMFMeanRegNbr: 10,
              },
            },
          ],
        },
      };
      resQ1.body.query.bool.filter = filterBody;
      expect(buildSearchMetricsQ1Query(indexName, sanitizedQuery)).to.deep.equals(resQ1);
    });

    it('should return a proper first query - with filter - lte', () => {
      sanitizedQuery.filters = [
        {
          name: 'vi_NF_SNSSAI_AMFMeanRegNbr',
          type: 'metric',
          metricType: { id: 'vi_NF_SNSSAI_AMFMeanRegNbr' },
          to: 10,
        },
      ];
      filterBody = {
        bool: {
          minimum_should_match: 1,
          must: [
            {
              range: {
                vi_NF_SNSSAI_AMFMeanRegNbr: {
                  gte: 0,
                },
              },
            },
          ],
          should: [
            {
              range: {
                vi_NF_SNSSAI_AMFMeanRegNbr: {
                  gte: 0,
                  lte: 10,
                },
              },
            },
          ],
        },
      };
      resQ1.body.query.bool.filter = filterBody;
      expect(buildSearchMetricsQ1Query(indexName, sanitizedQuery)).to.deep.equals(resQ1);
    });

    it('should return a proper first query - with filter - in range', () => {
      sanitizedQuery.filters = [
        {
          name: 'vi_NF_SNSSAI_AMFMeanRegNbr',
          type: 'metric',
          metricType: { id: 'vi_NF_SNSSAI_AMFMeanRegNbr' },
          from: 10,
          to: 20,
        },
      ];
      filterBody = {
        bool: {
          minimum_should_match: 1,
          must: [
            {
              range: {
                vi_NF_SNSSAI_AMFMeanRegNbr: {
                  gte: 0,
                },
              },
            },
          ],
          should: [
            {
              range: {
                vi_NF_SNSSAI_AMFMeanRegNbr: {
                  gte: 10,
                  lte: 20,
                },
              },
            },
          ],
        },
      };
      resQ1.body.query.bool.filter = filterBody;
      expect(buildSearchMetricsQ1Query(indexName, sanitizedQuery)).to.deep.equals(resQ1);
    });

    it('should return a proper first query - with filter - not in range', () => {
      sanitizedQuery.filters = [
        {
          name: 'vi_NF_SNSSAI_AMFMeanRegNbr',
          type: 'metric',
          metricType: { id: 'vi_NF_SNSSAI_AMFMeanRegNbr' },
          from: 10,
          to: 20,
          not: true,
        },
      ];
      filterBody = {
        bool: {
          minimum_should_match: 1,
          must: [
            {
              range: {
                vi_NF_SNSSAI_AMFMeanRegNbr: {
                  gte: 0,
                },
              },
            },
          ],
          should: [
            {
              range: {
                vi_NF_SNSSAI_AMFMeanRegNbr: {
                  lt: 10,
                },
              },
            },
            {
              range: {
                vi_NF_SNSSAI_AMFMeanRegNbr: {
                  gt: 20,
                },
              },
            },
          ],
        },
      };
      resQ1.body.query.bool.filter = filterBody;
      expect(buildSearchMetricsQ1Query(indexName, sanitizedQuery)).to.deep.equals(resQ1);
    });
  });

  describe('tests for buildSearchContextsQuery', () => {
    const query = {
      filters: [
        {
          type: 'entity',
          entityType: { id: 'c_SNSSAI' },
          searchPattern: '1:*',
        },
      ],
    };
    const responseQuery = {
      index: indexName,
      body: {
        from: undefined,
        query: {
          bool: {
            must: [
              {
                wildcard: {
                  c_SNSSAI: {
                    value: '1:*',
                    case_insensitive: true,
                  },
                },
              },
            ],
          },
        },
        size: undefined,
      },
    };
    it('should build a valid query given entity filters', () => {
      expect(buildSearchContextsQuery(indexName, query)).to.deep.equals(responseQuery);
    });

    const queryMustArray = [
      {
        match: {
          full_context: 'SNSSAI_Site',
        },
      },
      {
        wildcard: {
          c_SNSSAI: {
            value: '1:*',
            case_insensitive: true,
          },
        },
      },
    ];

    it('should build a valid query given a `ContextTypeId`', () => {
      query.contextTypeId = 'SNSSAI_Site';
      responseQuery.body.query.bool.must = queryMustArray;
      expect(buildSearchContextsQuery(indexName, query)).to.deep.equals(responseQuery);
    });

    const entityTypeSortArray = [
      {
        c_SNSSAI: {
          order: 'asc',
          unmapped_type: 'long',
        },
      },
    ];
    it('should build a valid query given an `EntityType` sortBy parameter and a sortOrder parameter', () => {
      query.contextTypeId = 'SNSSAI_Site';
      query.sortBy = { id: 'c_SNSSAI' };
      query.sortOrder = 'asc';
      responseQuery.body.query.bool.must = queryMustArray;
      responseQuery.body.sort = entityTypeSortArray;
      expect(buildSearchContextsQuery(indexName, query)).to.deep.equals(responseQuery);
    });

    const metricTypeSortArray = [
      {
        vi_NF_SNSSAI_AMFMeanRegNbr: {
          order: 'desc',
          unmapped_type: 'long',
        },
      },
    ];
    it('should build a valid query given a `MetricType` sortBy parameter and a sortOrder parameter', () => {
      query.contextTypeId = 'SNSSAI_Site';
      query.sortBy = { id: 'vi_NF_SNSSAI_AMFMeanRegNbr' };
      query.sortOrder = 'desc';
      responseQuery.body.query.bool.must = queryMustArray;
      responseQuery.body.sort = metricTypeSortArray;
      expect(buildSearchContextsQuery(indexName, query)).to.deep.equals(responseQuery);
    });

    it('should build a valid query given an offset parameter', () => {
      query.contextTypeId = 'SNSSAI_Site';
      query.sortBy = { id: 'c_SNSSAI' };
      query.sortOrder = 'asc';
      query.offset = 0;
      responseQuery.body.query.bool.must = queryMustArray;
      responseQuery.body.sort = entityTypeSortArray;
      responseQuery.body.from = query.offset;
      expect(buildSearchContextsQuery(indexName, query)).to.deep.equals(responseQuery);
    });

    it('should build a valid query given an offset parameter', () => {
      query.contextTypeId = 'SNSSAI_Site';
      query.sortBy = { id: 'c_SNSSAI' };
      query.sortOrder = 'asc';
      query.offset = 0;
      query.length = 1;
      responseQuery.body.query.bool.must = queryMustArray;
      responseQuery.body.sort = entityTypeSortArray;
      responseQuery.body.from = query.offset;
      responseQuery.body.size = query.length;
      expect(buildSearchContextsQuery(indexName, query)).to.deep.equals(responseQuery);
    });
  });

  describe('tests for buildSearchRelatedContextsFacetsQuery', () => {
    const contextFields = [{ id: 'AMF_BC', type: { id: 'c_NF' } }];
    const responseQuery = {
      index: indexName,
      body: {
        from: 0,
        size: 0,
        query: {
          bool: {
            must: [
              {
                match: {
                  full_context: fullContext,
                },
              },
              {
                match: {
                  c_NF: 'AMF_BC',
                },
              },
            ],
            filter: {
              bool: {
                must: [
                  {
                    range: {
                      [metricId]: {
                        gte: 0,
                      },
                    },
                  },
                ],
              },
            },
          },
        },
      },
    };
    it('should build a valid query given the required input arguments', () => {
      expect(
        buildSearchRelatedContextsFacetsQuery(indexName, fullContext, contextFields, metricId),
      ).to.deep.equals(responseQuery);
    });
  });
});

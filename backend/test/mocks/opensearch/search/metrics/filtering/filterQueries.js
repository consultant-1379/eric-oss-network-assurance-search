const filterQueries = {
  rangeFilterTestQuery1: {
    index: 'soa',
    body: {
      from: 0,
      size: 10,
      query: {
        bool: {
          must: [
            {
              match: {
                full_context: 'context1',
              },
            },
          ],
          filter: {
            bool: {
              must: [
                {
                  range: {
                    vi_context1_context1_AMFMeanRegNbr: {
                      gte: 1,
                      lte: 500,
                    },
                  },
                },
              ],
            },
          },
        },
      },
      sort: [
        {
          vi_context1_context1_AMFMeanRegNbr: {
            unmapped_type: 'long',
          },
        },
      ],
    },
  },
  rangeFilterTestQuery2: {
    index: 'soa',
    body: {
      query: {
        bool: {
          must: [
            {
              match: {
                full_context: 'context1',
              },
            },
          ],
          should: [
            {
              match: {
                c_SNSSAI: '1:1',
              },
            },
            {
              match: {
                c_SNSSAI: '1:2',
              },
            },
            {
              match: {
                c_SNSSAI: '2:1',
              },
            },
            {
              match: {
                c_SNSSAI: '2:2',
              },
            },
            {
              match: {
                c_NF: 'AMF_BC',
              },
            },
            {
              match: {
                c_NF: 'AMF_ON1',
              },
            },
            {
              match: {
                c_NF: 'AMF_ON2',
              },
            },
          ],
          minimum_should_match: 2,
          filter: {
            bool: {
              should: [
                {
                  range: {
                    vi_context1_AMFMeanRegNbr: {
                      gte: 1,
                      lte: 500,
                    },
                  },
                },
                {
                  range: {
                    vi_context1_AMFMeanRegNbr2: {
                      gte: 0,
                    },
                  },
                },
                {
                  range: {
                    vi_context1_AMFMeanRegNbr3: {
                      gte: 0,
                    },
                  },
                },
                {
                  range: {
                    vi_context1_AMFMeanRegNbr4: {
                      gte: 0,
                    },
                  },
                },
              ],
              minimum_should_match: 1,
            },
          },
        },
      },
    },
  },

  nameFilterQuery1: {
    index: 'soa',
    body: {
      from: 0,
      size: 10,
      query: {
        bool: {
          must: [
            {
              match: {
                full_context: 'NF_SNSSAI',
              },
            },
            { regexp: { c_NF: { value: 'AMF_.*' } } },
          ],
          filter: {
            bool: {
              must: [
                {
                  range: {
                    vi_context1_AMFMeanRegNbr: {
                      gte: 0,
                    },
                  },
                },
              ],
            },
          },
        },
      },
      sort: [
        {
          vi_context1_AMFMeanRegNbr: {
            unmapped_type: 'long',
          },
        },
      ],
    },
  },
  nameFilterQuery2: {
    index: 'soa',
    body: {
      query: {
        bool: {
          must: [
            {
              match: {
                full_context: 'NF_SNSSAI',
              },
            },
          ],
          should: [
            {
              match: {
                c_SNSSAI: '1:1',
              },
            },
            {
              match: {
                c_SNSSAI: '1:2',
              },
            },
            {
              match: {
                c_SNSSAI: '2:1',
              },
            },
            {
              match: {
                c_SNSSAI: '2:2',
              },
            },
            {
              match: {
                c_NF: 'AMF_BC',
              },
            },
            {
              match: {
                c_NF: 'AMF_ON1',
              },
            },
            {
              match: {
                c_NF: 'AMF_ON2',
              },
            },
          ],
          minimum_should_match: 2,
          filter: {
            bool: {
              should: [
                {
                  range: {
                    vi_context1_AMFMeanRegNbr: {
                      gte: 0,
                    },
                  },
                },
                {
                  range: {
                    vi_context1_AMFMeanRegNbr2: {
                      gte: 0,
                    },
                  },
                },
                {
                  range: {
                    vi_context1_AMFMeanRegNbr3: {
                      gte: 0,
                    },
                  },
                },
                {
                  range: {
                    vi_context1_AMFMeanRegNbr4: {
                      gte: 0,
                    },
                  },
                },
              ],
              minimum_should_match: 1,
            },
          },
        },
      },
    },
  },

  multiFilterTestQuery1: {
    index: 'soa',
    body: {
      from: 0,
      size: 10,
      query: {
        bool: {
          must: [
            {
              match: {
                full_context: 'NF_SNSSAI',
              },
            },
            { regexp: { c_NF: { value: 'AMF_.*' } } },
          ],
          filter: {
            bool: {
              must: [
                {
                  range: {
                    vi_context1_AMFMeanRegNbr: {
                      gte: 1,
                      lte: 500,
                    },
                  },
                },
              ],
            },
          },
        },
      },
      sort: [
        {
          vi_context1_AMFMeanRegNbr: {
            unmapped_type: 'long',
          },
        },
      ],
    },
  },
  multiFilterTestQuery2: {
    index: 'soa',
    body: {
      query: {
        bool: {
          must: [
            {
              match: {
                full_context: 'NF_SNSSAI',
              },
            },
          ],
          should: [
            {
              match: {
                c_SNSSAI: '1:1',
              },
            },
            {
              match: {
                c_SNSSAI: '1:2',
              },
            },
            {
              match: {
                c_SNSSAI: '2:1',
              },
            },
            {
              match: {
                c_SNSSAI: '2:2',
              },
            },
            {
              match: {
                c_NF: 'AMF_BC',
              },
            },
            {
              match: {
                c_NF: 'AMF_ON1',
              },
            },
            {
              match: {
                c_NF: 'AMF_ON2',
              },
            },
          ],
          minimum_should_match: 2,
          filter: {
            bool: {
              should: [
                {
                  range: {
                    vi_context1_AMFMeanRegNbr: {
                      gte: 1,
                      lte: 500,
                    },
                  },
                },
                {
                  range: {
                    vi_context1_AMFMeanRegNbr2: {
                      gte: 0,
                    },
                  },
                },
                {
                  range: {
                    vi_context1_AMFMeanRegNbr3: {
                      gte: 0,
                    },
                  },
                },
                {
                  range: {
                    vi_context1_AMFMeanRegNbr4: {
                      gte: 0,
                    },
                  },
                },
              ],
              minimum_should_match: 1,
            },
          },
        },
      },
    },
  },
};

export { filterQueries };

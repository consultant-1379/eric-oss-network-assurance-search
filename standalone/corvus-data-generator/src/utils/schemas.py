from enum import Enum
from pydantic import BaseModel, ConfigDict, Field
from typing import Union, Optional


class ValueType(str, Enum):
    INTEGER = "integer"
    FLOAT = "float"


class SortOrder(str, Enum):
    ASC = ("asc",)
    DESC = "desc"


class EntityType(BaseModel):
    id: str
    name: Optional[str] = None
    description: Optional[str] = None


class MetricType(BaseModel):
    id: str
    name: Optional[str] = None
    valueType: Optional[ValueType] = ValueType.INTEGER
    description: Optional[str] = None
    unit: Optional[str] = None


class Filter(BaseModel):
    name: Optional[str] = None
    not_: Optional[bool] = Field(default=False, alias="not")

    model_config = ConfigDict(populate_by_name=True)


class EntityFilter(Filter):
    type: str
    entityType: EntityType
    searchPattern: str


class MetricFilter(Filter):
    type: str
    metricType: MetricType
    from_: Optional[Union[int, float]] = Field(alias="from")
    to_: Optional[Union[int, float]] = Field(alias="to")

    model_config = ConfigDict(populate_by_name=True)

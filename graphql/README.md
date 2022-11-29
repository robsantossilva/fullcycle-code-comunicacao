https://gqlgen.com/

```bash
go run github.com/99designs/gqlgen generate
```

Queries and Mutations
```graphql
mutation createCategory {
  createCategory(input: {name: "Tecnologia",description: "Cursos de Tecnologia"}){
    id
    name
    description
  }
}

query queryCategories {
  categories {
    id
    name
    description
  }
}

query queryCategoriesWithCourses {
  categories {
    id
    name
    description
    courses {
      id
      name
    }
  }
}

mutation createCourse {
  createCourse(input: {
    name: "Curso de Golang",
    description: "Cursos básico de golang",
    categoryId: "3d06033f-ee66-41ad-be88-176147b44083"
  }){
    id
    name
    description
  }
}

query queryCourses {
  courses {
    id
    name
    description
  }
}

query queryCoursesWithCategory {
  courses {
    id
    name
    description
    category {
      id
      name
      description
    }
  }
}
```